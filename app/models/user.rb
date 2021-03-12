class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_one :profile, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :location

  # Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /[A-Za-z0-9]/i
  validates :username, uniqueness: true, length: { maximum: 25, minimum: 5 }, format: { with: VALID_USERNAME_REGEX }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  # Create profile
  before_save :init_profile
  # after_create :send_welcome

  def init_profile
    self.build_profile
  end

  #  Insert latitude and longitude into profile
  geocoded_by :geolocation
  before_save :geocode
  
  def geolocation
      "#{self.location.city}, #{self.location.state}, Australia"
  end

  # def send_welcome
  #   UserMailer.with(user: self).welcome.deliver_now
  # end
end
