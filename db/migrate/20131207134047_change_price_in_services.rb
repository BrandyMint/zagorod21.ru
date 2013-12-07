class ChangePriceInServices < ActiveRecord::Migration
  def change
    change_column :services, :price, :string
  end
end
