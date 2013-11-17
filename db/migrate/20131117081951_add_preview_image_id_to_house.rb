class AddPreviewImageIdToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :preview_id, :integer
  end
end
