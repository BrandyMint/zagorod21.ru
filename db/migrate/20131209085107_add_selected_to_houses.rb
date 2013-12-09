class AddSelectedToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :selected, :boolean, default: false, null: false
  end
end
