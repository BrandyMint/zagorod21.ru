class AddAccusativeTitleToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :accusative_title, :string
  end
end
