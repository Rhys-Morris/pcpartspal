class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  # Validations
  validates :rating, presence: true, numericality: { greater_than: -1, less_than: 6}
  validates :message, presence: true
  
end
