class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  has_many_attached :images
  has_many :watches, dependent: :destroy
  has_many :profiles, through: :watches
  has_many :purchases, dependent: :destroy
  enum condition: { Used: 0, New: 1 }

  # Validations
  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :condition, presence: true

end
