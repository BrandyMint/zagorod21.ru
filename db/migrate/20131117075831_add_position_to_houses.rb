class AddPositionToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :map_iframe, :text
  end
end
