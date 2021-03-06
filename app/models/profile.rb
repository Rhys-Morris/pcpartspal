class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :watches, dependent: :destroy
  has_many :listings, through: :watches
  has_one_attached :image
  validates :location, presence: true
  validates :postcode, numericality: { greater_than: 200, less_than: 9945 }
  validates :bio, length: { maximum: 500 }

  #  Insert latitude and longitude into profile
  geocoded_by :address
  before_save :geocode

    def address
      "#{self.location}, Australia"
    end
end
