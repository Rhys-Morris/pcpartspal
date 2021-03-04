class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :purchases, dependent: :destroy
  validates :username, uniqueness: true
  before_create :init_profile

  private

  def init_profile
    build_profile
  end

end
