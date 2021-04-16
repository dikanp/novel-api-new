class Novel < ApplicationRecord
  validates :title, presence: true
  belongs_to :author
  belongs_to :genre
  belongs_to :user
end
