class Profile < ApplicationRecord
  belongs_to :user
  has_one :watchlist
  before_create :init_watchlist

  private

    def init_watchlist
      build_watchlist
    end

end
