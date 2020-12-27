class Contact < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_many :addresses
  has_many :phones
  has_many :credit_cards
end
