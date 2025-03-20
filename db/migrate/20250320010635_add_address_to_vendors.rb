class AddAddressToVendors < ActiveRecord::Migration[7.2]
  def change
    add_column :vendors, :address, :string
  end
end
