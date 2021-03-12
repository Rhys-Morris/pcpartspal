class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true, length: { maximum: 500 }
  validates :subject, presence: true, length: { maximum: 100 }
end
