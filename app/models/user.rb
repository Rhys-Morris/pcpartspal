class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_many :listings
  validates :username, uniqueness: true
  before_create :init_profile

  private

  def init_profile
    build_profile
  end

end
