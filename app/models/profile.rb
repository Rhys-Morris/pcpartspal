class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :watches, dependent: :destroy
  has_many :listings, through: :watches
  has_one_attached :image

  #  Insert latitude and longitude into profile
  geocoded_by :location
  before_save :geocode

    def location
      "#{self.user.location.city}, #{self.user.location.state}, Australia"
    end
end
