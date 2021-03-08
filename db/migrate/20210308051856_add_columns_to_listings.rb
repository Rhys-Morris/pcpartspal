class AddColumnsToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :reviewed, :boolean
    add_column :listings, :length, :integer
    add_column :listings, :height, :integer
    add_column :listings, :width, :integer
    add_column :listings, :weight, :float
  end
end
