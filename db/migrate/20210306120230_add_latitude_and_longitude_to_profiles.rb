class AddLatitudeAndLongitudeToProfiles < ActiveRecord::Migration[6.1]
  def up
    add_column :profiles, :latitude, :string
    add_column :profiles, :longitude, :string
  end
  def down
    remove_column :profiles, :latitude, :string
    remove_column :profiles, :longitude, :string
  end
end
