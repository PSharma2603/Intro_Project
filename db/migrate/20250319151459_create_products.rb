class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.string :image_url
      t.float :rating
      t.integer :stock_quantity
      t.integer :discount

      t.timestamps
    end
  end
end
