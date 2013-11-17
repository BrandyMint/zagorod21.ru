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

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :description, :price_wd, :price_bd, :price_bd_hour, :map_iframe
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
