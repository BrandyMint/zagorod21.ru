class AddAcceptOrdersToadminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :accept_orders, :boolean, default: false, null: false
    add_column :admin_users, :phone, :string
  end
end
