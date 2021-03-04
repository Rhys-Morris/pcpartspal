class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :listings, dependent: :destroy
  has_many :purchases
  validates :username, uniqueness: true

  def with_profile
    self.profile = Profile.new
    self
  end
end
