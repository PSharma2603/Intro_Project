class CreateVendors < ActiveRecord::Migration[7.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :contact_info

      t.timestamps
    end
  end
end
