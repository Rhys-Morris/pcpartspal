class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true, length: { maximum: 500 }
  validates :subject, presence: true, length: { maximum: 50 }

  before_save :remove_whitespace

  private
    def remove_whitespace
      self.body = body.strip
      self.subject = subject.strip
    end
end
