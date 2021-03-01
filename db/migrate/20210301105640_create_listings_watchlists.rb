class CreateListingsWatchlists < ActiveRecord::Migration[6.1]
  def change
    create_table :listings_watchlists do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :watchlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
