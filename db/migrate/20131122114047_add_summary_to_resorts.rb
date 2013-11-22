class AddSummaryToResorts < ActiveRecord::Migration
  def change
    add_column :resorts, :summary, :text
  end
end
