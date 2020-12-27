class Address < ApplicationRecord
  validates :address, presence: true

  belongs_to :contact
end
