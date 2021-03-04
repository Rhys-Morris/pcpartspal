class Category < ApplicationRecord
    has_many :listings, dependent: :destroy
    validates :name, presence: true, uniqueness: true
end
