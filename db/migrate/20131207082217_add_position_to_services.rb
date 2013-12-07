class AddPositionToServices < ActiveRecord::Migration
  def change
    add_column :services, :position, :integer, null: false, default: 0
  end
end
