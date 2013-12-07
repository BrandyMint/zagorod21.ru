class AddMainToServices < ActiveRecord::Migration
  def change
    add_column :services, :main, :boolean, null: false, default: false
  end
end
