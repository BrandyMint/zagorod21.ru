ActiveAdmin.register Image do

  show do |image|
    attributes_table do
      row :file do
        image_tag image.file.standard.url
      end
    end
  end

  index as: :block do |image|
    div :for => image do
      h3 do
        link_to image.house, admin_house_url(image.house)
      end
      div do
        image_tag image.file.thumb.url
      end
    end
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :file, :description, :house_id
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
