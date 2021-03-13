class ChangeDataTypeForListingsPrice < ActiveRecord::Migration[6.1]
  def up
    change_table :listings do |t|
      t.change :price, :float
    end
  end
  def down
    change_table :listings do |t|
      t.change :price, :integer
    end
  end
end
