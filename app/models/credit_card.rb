class CreditCard < ApplicationRecord
  validates :last_four_numbers, presence: true
  validates :encrypted_number, presence: true
  validates :franchise_id, presence: true
  validates :contact_id, presence: true

  belongs_to :franchise
end
