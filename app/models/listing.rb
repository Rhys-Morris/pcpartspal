class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  enum condition: { Used: 0, New: 1 }
  validates :title, presence: true
  validates :description, length: { maximum: 250 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :condition, presence: true

end
