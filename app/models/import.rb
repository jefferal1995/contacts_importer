class Import < ApplicationRecord
  has_one_attached :contacts_file
  enum status: [:started, :in_progress, :failed, :finished]

  belongs_to :user
  has_many :logs
end
