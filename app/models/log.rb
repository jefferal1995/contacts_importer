class Log < ApplicationRecord
  validates :message, presence: true

  belongs_to :import
end
