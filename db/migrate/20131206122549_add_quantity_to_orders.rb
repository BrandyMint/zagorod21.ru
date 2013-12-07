class AddQuantityToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :people_quantity, :numeric, null: false
    add_column :orders, :money_amount, :numeric, null: false
  end
end
