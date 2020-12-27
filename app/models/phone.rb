class Phone < ApplicationRecord
  validates :number, format: { with: /^(\(\+[0-9]{1,3}\) [0-9]{3} [0-9]{3} [0-9]{2} [0-9]{2}|\(\+[0-9]{1,3}\) [0-9]{3}-[0-9]{3}-[0-9]{2}-[0-9]{2})$/ }
end
