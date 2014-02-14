class AddPriceRangeToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :price_range, :string
  end
end
