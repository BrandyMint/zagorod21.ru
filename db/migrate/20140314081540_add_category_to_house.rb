class AddCategoryToHouse < ActiveRecord::Migration
  class House < ActiveRecord::Base
  end

  def change
    add_column :houses, :category_id, :integer, index: true

    c = Category.create!(name: 'Все дома')
    c.save!

    House.reset_column_information
    reversible do |dir|
      dir.up { House.update_all category_id: c.id }
    end

    change_column :houses, :category_id, :integer, :null => false
  end
end
