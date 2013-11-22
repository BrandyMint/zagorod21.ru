class AddSummaryToResorts < ActiveRecord::Migration
  def change
    add_column :resorts, :summary, :text
    add_column :houses, :summary, :text
  end
end
