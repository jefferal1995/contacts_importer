class ContactWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  require 'csv'
  require 'digest/sha1'

  def perform(import_id)
    import = Import.find_by_id(import_id)
    rows = read_csv_file(contacts_file_on_disk(import))

    import.update(status: 'in_progress')
    import.logs.create(message: "Beginning the creation of #{rows.count} contacts")

    rows.each do |row|
      contact = create_contact(import, row)
      break if contact.blank?

      phone = create_phone(contact, import, row)
      break if phone.blank?

      address = create_address(contact, import, row)
      break if address.blank?

      credit_card = create_credit_card(contact, import, row)
      break if credit_card.blank?

      import.logs.create(message: 'Finishing loading contact')
      import.update(status: 'finished')
    end

    import.logs.create(message: 'Finishing loading CSV file')
  rescue => e
    imports.logs.create(message: "Failed unexpectedly #{e.message}")
    imports.update(status: 'failed')
  end

  private

  def contacts_file_on_disk(import)
    ActiveStorage::Blob.service.send(:path_for, import.contacts_file.key)
  end

  def read_csv_file(path)
    rows = CSV.read(path, encoding: "bom|utf-8", col_sep: ',')
    columns = rows.shift.map {|r| r.underscore.downcase.gsub(/\s/, "_").gsub(/_+/, "_") }
    rows.collect {|row| Hash[columns.zip(row)] }
  end

  def get_formatted_date(d)
    Date.strptime(d, '%Y%m%d') rescue Date.strptime(d, '%F') rescue nil
  end

  def search_franchise(number)
    Franchise.all.each do |franchise|
      if number.start_with?(*franchise.start_numbers) && franchise.lengths.include?(number.length.to_s)
        return franchise.id
      end
    end
  end

  def create_contact(import, row)
    contact_attributes = {
      user_id: import.user.id,
      name: row['name'],
      birth_date: get_formatted_date(row['birth_date']),
      email: row['email']
    }

    existing_contact = Contact.find_by(email: row['email'])
    contact = if existing_contact.present?
                import.logs.create(message: "Found existing contact #{existing_contact.email}")
                existing_contact
              else
                import.logs.create(message: "Creating a new contact #{row['email']}")
                Contact.create(contact_attributes)
              end

    if contact.errors.size > 0
      import.logs.create(message: contact.errors.map{ |attribute, error| attribute.to_s +  "  " +  error.to_s}.flatten.join(", "))
      import.update(status: 'failed')
      contact = nil
    end

    contact
  end

  def create_phone(contact, import, row)
    phone_attributes = {
      number: row['phone'],
    }

    existing_phone = contact.phones.where("regexp_replace(number, '[^0-9]+', '', 'g') = ?", row['phone'].tr('^0-9', '')).first
    phone = if existing_phone.present?
                import.logs.create(message: "Found existing phone #{existing_phone.number}")
                existing_phone
              else
                import.logs.create(message: "Creating a new phone #{row['phone']}")
                contact.phones.create(phone_attributes)
              end

    if phone.errors.size > 0
      import.logs.create(message: phone.errors.map{ |attribute, error| attribute.to_s +  "  " +  error.to_s}.flatten.join(", "))
      import.update(status: 'failed')
      phone = nil
    end

    phone
  end

  def create_address(contact, import, row)
    address_attributes = {
      address: row['address'],
    }

    existing_address = contact.addresses.find_by(address: row['address'])
    address = if existing_address.present?
              import.logs.create(message: "Found existing address #{existing_address.address}")
              existing_address
            else
              import.logs.create(message: "Creating a new address #{row['address']}")
              contact.addresses.create(address_attributes)
            end

    if address.errors.size > 0
      import.logs.create(message: address.errors.map{ |attribute, error| attribute.to_s +  "  " +  error.to_s}.flatten.join(", "))
      import.update(status: 'failed')
      address = nil
    end

    address
  end

  def create_credit_card(contact, import, row)
    credit_card_attributes = {
      last_four_numbers: row['card_number'][-4..-1],
      encrypted_number: Digest::SHA1.hexdigest(row['card_number']),
      franchise_id: search_franchise(row['card_number']),
    }

    existing_credit_card = contact.credit_cards.find_by(encrypted_number: credit_card_attributes[:encrypted_number])
    credit_card = if existing_credit_card.present?
                    import.logs.create(message: "Found existing credit card #{existing_credit_card.last_four_numbers}")
                    existing_credit_card
                  else
                    import.logs.create(message: "Creating a new credit card ***#{row['card_number'][-4..-1]}")
                    contact.credit_cards.create(credit_card_attributes)
                  end

    if credit_card.errors.size > 0
      import.logs.create(message: credit_card.errors.map{ |attribute, error| attribute.to_s +  "  " +  error.to_s}.flatten.join(", "))
      import.update(status: 'failed')
      credit_card = nil
    end

    credit_card
  end
end