ActiveAdmin.register Image do

  show do |image|
    attributes_table do
      row :resource
      row :description
      Image.first.file.versions.keys.each do |version|
        row version do
          div do
            image_tag image.file.send(version).url
          end
          div do
            image.file.send(version).size
          end
        end
      end
    end
  end

  index as: :block do |image|
    div :for => image do
      h3 do
        link_to image.resource, admin_resource_url(image.resource)
      end
      div do
        link_to admin_image_url(image) do
          image_tag image.file.thumb.url
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :resource_type
      f.input :resource_id
      f.input :file
      f.input :description
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params *Image.attribute_names
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
end
