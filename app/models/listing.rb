class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  has_many_attached :images
  has_many :watches, dependent: :destroy
  has_many :profiles, through: :watches
  has_many :purchases, dependent: :destroy
  has_one :review
  enum condition: { Used: 0, New: 1 }

  # Validations
  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :condition, presence: true
  validates :length, presence: true, numericality: { greater_than: 0, less_than: 300 }
  validates :height, presence: true, numericality: { greater_than: 0, less_than: 300 }
  validates :width, presence: true, numericality: { greater_than: 0, less_than: 300 }
  validates :weight, presence: true, numericality: { greater_than: 0, less_than: 150 }

  def self.filter(filtered_params)
    Listing.where(filtered_params)
  end 
end
