class AddRoomsToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :rooms_count, :integer
  end
end
