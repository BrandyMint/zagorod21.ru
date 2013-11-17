class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :title
      t.text :description
      t.decimal :price_bd
      t.decimal :price_wd
      t.decimal :price_bd_hour

      t.timestamps
    end
  end
end
