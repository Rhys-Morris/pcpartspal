class Brand < ApplicationRecord
    has_many :listings, dependent: :destroy
end
