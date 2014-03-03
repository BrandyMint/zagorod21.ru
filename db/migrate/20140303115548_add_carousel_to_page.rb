class AddCarouselToPage < ActiveRecord::Migration
  def change
    add_column :pages, :carousel, :boolean
  end
end
