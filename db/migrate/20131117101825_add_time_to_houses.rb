class AddTimeToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :time, :integer
  end
end
