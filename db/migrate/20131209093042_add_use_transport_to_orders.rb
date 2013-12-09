class AddUseTransportToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :use_transport, :boolean, default: false, null: false
    add_column :orders, :food_state, :string, default: 'none', null: false
  end
end
