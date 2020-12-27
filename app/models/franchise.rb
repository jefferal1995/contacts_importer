class Franchise < ApplicationRecord
  validates :name, presence: true
  validates :lengths, presence: true
  validates :start_numbers, presence: true
end
