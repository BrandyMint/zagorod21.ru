class CreateCities < ActiveRecord::Migration
  def up
    create_table :cities do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.timestamps
    end

    add_column :resorts, :city_id, :integer
    add_index :resorts, :city_id
    add_index :cities, :title, unique: true, using: :btree
    add_index :cities, :slug, unique: true, using: :btree

    cheboksary = City.create(title: "Чебоксары", slug: 'cheboksary')
    Resort.update_all(city_id: cheboksary.id)
  end

  def down
    drop_table :cities
    remove_column :resorts, :city_id
    remove_index :resorts, :city_id
  end
end
