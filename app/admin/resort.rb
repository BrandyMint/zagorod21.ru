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

  show do |resort|
    attributes_table do
      row :link do
        link_to 'Публичная страница', resort_url(resort)
      end
      row :title
      row :description do
        simple_format resort.description
      end
      row :summary do
        simple_format resort.description
      end
      row :image do
        image_tag resort.preview.file.thumb.url if resort.preview.present?
      end

      row :site
      row :distance
      row :time

      row :map do
        resort.map_iframe.try :html_safe
      end

      row :resorts do
        ul do
          resort.houses.each do |house|
            li link_to house.title, admin_house_url(house)
          end
        end
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