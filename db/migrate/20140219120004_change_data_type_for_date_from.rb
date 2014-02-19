class ChangeDataTypeForDateFrom < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.change :date_from, :datetime
    end
  end
end
