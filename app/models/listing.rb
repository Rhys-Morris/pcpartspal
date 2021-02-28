class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  validates :title, presence: true
  validates :description, length: { maximum: 250 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

end
