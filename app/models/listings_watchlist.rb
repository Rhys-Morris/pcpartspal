class ListingsWatchlist < ApplicationRecord
  belongs_to :listing
  belongs_to :watchlist
end
