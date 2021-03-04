class Category < ApplicationRecord
    has_many :listings, dependent: :destroy
end
