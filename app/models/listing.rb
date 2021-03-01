class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  has_many_attached :images
  has_many :watchlists, through: :listingswatchlist
  enum condition: { Used: 0, New: 1 }

  # Validations
  validates :title, presence: true
  validates :description, length: { maximum: 250 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :condition, presence: true

end
