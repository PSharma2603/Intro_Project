class CreateJoinTableProductsVendors < ActiveRecord::Migration[6.1]
  def change
    create_join_table :products, :vendors do |t|
      t.index [:product_id, :vendor_id]
      t.index [:vendor_id, :product_id]
    end
  end
end
