class AddCapacityToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :capacity, :integer
  end
end
