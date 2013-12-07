class CreateMetaTags < ActiveRecord::Migration
  def change
    create_table :meta_tag_pages do |t|
      t.string :path, null: false
      t.string :site
      t.string :title
      t.text :keywords
      t.text :description
      t.boolean :noindex, null: false, default: false
      t.boolean :nofollow, null: false, default: false
      t.string :canonical
      t.string :prefix
      t.string :separator
      t.string :suffix
      t.string :prev
      t.string :next

      t.timestamps
    end
  end
end
