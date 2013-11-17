class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
