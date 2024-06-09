class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :label
      t.text :description
      t.integer :price
      t.integer :quantity
      t.string :sku

      t.timestamps
    end
    add_index :products, :sku, unique: true
  end
end
