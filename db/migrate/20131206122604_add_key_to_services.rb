class AddKeyToServices < ActiveRecord::Migration
  def change
    add_column :services, :key, :string, null: false

    add_index :services, :key, unique: true
  end
end
