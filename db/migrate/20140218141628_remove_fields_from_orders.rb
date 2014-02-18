class RemoveFieldsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :food_state, :string
    remove_column :orders, :use_transport, :boolean
    change_column :orders, :people_quantity, :integer, :null => true
    change_column :orders, :money_amount, :decimal, :null => true
  end
end
