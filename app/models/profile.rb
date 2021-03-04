class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :watches, dependent: :destroy
  has_many :listings, through: :watches
  # validates :postcode, numericality: { greater_than: 200, less_than: 9945 }
  # validates :bio, length: { maximum: 500 }
end
