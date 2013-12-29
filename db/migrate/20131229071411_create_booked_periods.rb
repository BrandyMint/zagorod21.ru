class CreateBookedPeriods < ActiveRecord::Migration
  def change
    create_table :booked_periods do |t|
      t.references :house, index: true, null: false
      t.date :date_from, null: false
      t.date :date_to, null: false
      t.integer :state_cd, null: false, default: 0

      t.timestamps
    end

    add_index :booked_periods, [:house_id, :date_from, :date_to]
  end
end
