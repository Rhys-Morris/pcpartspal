class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :watches, dependent: :destroy
  has_many :listings, through: :watches
<<<<<<< HEAD
  has_one_attached :image
=======
  validates :location, presence: true
  validates :postcode, numericality: { greater_than: 200, less_than: 9945 }
  validates :bio, length: { maximum: 500 }
>>>>>>> c01f095d9ecdf1c1c05cb611415584930dcd1c00
end
