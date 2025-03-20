class AddLatitudeAndLongitudeToVendors < ActiveRecord::Migration[7.2]
  def change
    add_column :vendors, :latitude, :float
    add_column :vendors, :longitude, :float
  end
end
