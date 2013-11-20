class AddSiteToResorts < ActiveRecord::Migration
  def change
    add_column :resorts, :site, :string
  end
end
