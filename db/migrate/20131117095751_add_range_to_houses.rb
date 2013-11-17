class AddRangeToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :range, :integer
  end
end
