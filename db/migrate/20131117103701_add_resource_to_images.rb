class AddResourceToImages < ActiveRecord::Migration
  def change
    add_column :images, :resource_type, :string, null: false
    add_column :images, :resource_id, :integer, null: false

    add_index :images, [:resource_type, :resource_id]

    remove_column :images, :house_id
  end
end
