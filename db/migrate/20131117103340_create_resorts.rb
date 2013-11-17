class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.string :title, null: false
      t.text :description
      t.decimal :distance
      t.decimal :time
      t.text :map_iframe
      t.integer :preview_id

      t.timestamps
    end

    remove_column :houses, :range
    remove_column :houses, :map_iframe
    remove_column :houses, :time

    add_column :houses, :resort_id, :integer, unique: true
  end
end
