class Watchlist < ApplicationRecord
  belongs_to :profile
  has_many :listings, through: :listingswatchlist
  
end
