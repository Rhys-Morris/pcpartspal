class Profile < ApplicationRecord
  belongs_to :user
  has_many :watches, dependent: :destroy
  has_many :listings, through: :watches
end
