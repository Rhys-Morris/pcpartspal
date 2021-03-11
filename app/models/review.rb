class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  # Validations
  validates :rating, presence: true, numericality: { in: 1..5 }
  validates :message, presence: true, length: { maximum: 250 }
end
