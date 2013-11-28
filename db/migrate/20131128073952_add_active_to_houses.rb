class AddActiveToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :active, :boolean, default: true, null: false
    add_column :resorts, :active, :boolean, default: true, null: false
  end
end
