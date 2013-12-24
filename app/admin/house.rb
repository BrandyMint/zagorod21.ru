ActiveAdmin.register House do

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :active
      f.input :selected
      f.input :resort
      f.input :title
      f.input :capacity
      f.input :summary
      f.input :description
    end
    f.inputs 'Цены' do
      f.input :price_bd
      f.input :price_wd
      f.input :price_bd_hour
    end

    #f.has_many :images do |image|
      #image.input :file
      #image.input :description
    #end
    f.actions
  end

  show do |house|
    attributes_table do
      row :active
      row :selected
      row :link do
        link_to 'Публичная страница', house_url(house)
      end
      row :resort
      row :title
      row :description do
        simple_format house.description
      end
      row :summary do
        simple_format house.summary
      end
      row :image do
        image_tag house.preview.file.thumb.url if house.preview.present?
      end
    end
    active_admin_comments
  end

  index do
    column :active
    column :preview do |house|
      image_tag house.preview.file.thumb.url if house.preview.present?
    end
    column :title
    column :price_bd
    column :price_wd
    column :price_bd_hour
    column :capacity
    column :images do |house|
      ul do
        li link_to "Картинки #{house.images.count}", admin_resource_images_url(house)
        li link_to "Добавить", new_admin_image_url(image: { resource_type: 'House', resource_id: house.id})
      end
    end
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
