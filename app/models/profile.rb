class Profile < ApplicationRecord
  belongs_to :user
  has_many :watches
  has_many :listings, through: :watches
end
