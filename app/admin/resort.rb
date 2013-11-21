ActiveAdmin.register Resort do

  index do
    column :preview do |resort|
      image_tag resort.preview.file.thumb.url if resort.preview.present?
    end
    column :title
    column :houses_count do |resort|
      link_to "Домов: #{resort.houses.count}", admin_houses_url(q: { resort_id_eq: resort.id})
    end
    column :images do |resort|
      ul do
        li link_to "Картинки #{resort.images.count}", admin_images_url(q: { resort_id_id: resort.id})
        li link_to "Добавить", new_admin_image_url(image: { resource_type: 'Resort', resource_id: resort.id})
      end
    end
    actions

  end

  show do |house|
    attributes_table do
      row :title
      row :description do
        simple_format house.description
      end
      row :image do
        image_tag resort.preview.file.thumb.url if resort.preview.present?
      end

      row :site
      row :distance
      row :time

      row :map do
        house.map_iframe.try :html_safe
      end
    end
    active_admin_comments
  end

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params *Resort.attribute_names
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
