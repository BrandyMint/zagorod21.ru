class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :house, index: true, null: true
      t.string :phone, null: true
      t.string :name, null: true
      t.string :state, null: true
      t.date   :date_from, null: true
      t.date   :date_to, null: true

      t.timestamps
    end
  end
end
