class RemoveUserIdFromOrders < ActiveRecord::Migration[7.2]
  def change
    remove_reference :orders, :user, null: false, foreign_key: true
  end
end
