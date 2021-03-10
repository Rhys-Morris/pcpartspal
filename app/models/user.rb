class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :listings, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :username, uniqueness: true
  belongs_to :location

  # Create profile
  before_save :init_profile

  def init_profile
    self.build_profile
  end

  #  Insert latitude and longitude into profile
  geocoded_by :geolocation
  before_save :geocode
  
  def geolocation
      "#{self.location.city}, #{self.location.state}, Australia"
  end
end
