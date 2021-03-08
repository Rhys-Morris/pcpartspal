class Location < ApplicationRecord
    has_many :users, dependent: :destroy
end