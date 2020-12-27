class Phone < ApplicationRecord
  validates :number, format: { with: /\A(\(\+[0-9]{1,3}\) [0-9]{3} [0-9]{3} [0-9]{2} [0-9]{2}|\(\+[0-9]{1,3}\) [0-9]{3}-[0-9]{3}-[0-9]{2}-[0-9]{2})$\z/i }
end
