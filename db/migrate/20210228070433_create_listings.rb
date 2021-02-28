class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.boolean :sold
      t.integer :condition
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
