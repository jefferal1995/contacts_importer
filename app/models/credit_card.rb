class CreditCard < ApplicationRecord
  validates :number, presence: true

end
