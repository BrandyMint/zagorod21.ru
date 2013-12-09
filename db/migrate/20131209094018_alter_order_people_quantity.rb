class AlterOrderPeopleQuantity < ActiveRecord::Migration
  def change
    change_column :orders, :people_quantity, :integer
  end
end
