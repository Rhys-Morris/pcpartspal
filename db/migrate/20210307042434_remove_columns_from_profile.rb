class RemoveColumnsFromProfile < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :bio, :text
    remove_column :profiles, :location, :string
    remove_column :profiles, :postcode, :integer
  end
end
