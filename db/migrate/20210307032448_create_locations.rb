class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :postcode
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
