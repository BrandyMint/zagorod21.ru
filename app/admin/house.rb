ActiveAdmin.register House do

  show do |house|
    attributes_table do
      row :title
      row :description do
        simple_format house.description
      end
      row :image do
        #image_tag house.preview.url if house.preview?
      end

      row :map do
        house.map_iframe.html_safe
      end
    end
  end

  index do
    column :preview do |house|
      image_tag house.preview.file.thumb.url if house.preview.present?
    end
    column :title
    column :price_bd
    column :price_wd
    column :price_bd_hour
    column :capacity
    column :distance
    column :time
    actions
  end

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params *House.attribute_names
  #:title, :description, :price_wd, :price_bd, :price_bd_hour, :map_iframe, :capacity, :range, :time
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
