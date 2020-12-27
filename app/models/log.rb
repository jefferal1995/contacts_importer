class Log < ApplicationRecord
  validates :message, presence: true
end
