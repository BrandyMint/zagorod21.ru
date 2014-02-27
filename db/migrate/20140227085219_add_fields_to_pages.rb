class AddFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :template, :string
    add_column :pages, :preview_id, :integer
  end
end
