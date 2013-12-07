class CreateAddPositionToServices < ActiveRecord::Migration
  def change
    create_table :add_position_to_services do |t|
      t.integer :position

      t.timestamps
    end
  end
end
