class CreateCoraPhrases < ActiveRecord::Migration
  def change
    create_table :cora_phrases do |t|
      t.string :locale, null: false, default: 'en'
      t.string :key, null: false
      t.text   :value, null: false

      t.timestamps
    end

    add_index :cora_phrases, [:locale, :key], unique: true
  end
end
