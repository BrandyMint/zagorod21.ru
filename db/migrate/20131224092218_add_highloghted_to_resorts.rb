class AddHighloghtedToResorts < ActiveRecord::Migration
  def change
    add_column :resorts, :highlighted, :boolean, default: false
  end
end
