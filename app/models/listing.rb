class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  has_many_attached :images
  has_many :watches, dependent: :destroy
  has_many :profiles, through: :watches
  has_one :purchase, dependent: :destroy
  has_one :review, dependent: :destroy
  enum condition: { Used: 0, New: 1 }

  # Validations
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :condition, presence: true
  validates :length, presence: true, numericality: { greater_than: 0, less_than: 300 }
  validates :height, presence: true, numericality: { greater_than: 0, less_than: 300 }
  validates :width, presence: true, numericality: { greater_than: 0, less_than: 300 }
  validates :weight, presence: true, numericality: { greater_than: 0, less_than: 150 }

  before_save :remove_whitespace
  before_validation :convert_price_to_cents, if: :price_changed?

  def self.filter(filtered_params)
    Listing.where(filtered_params)
  end

  private
    def remove_whitespace
      self.title = title.strip
      self.description = description.strip
    end

    def convert_price_to_cents
      self.price = (price * 100)
    end
end
