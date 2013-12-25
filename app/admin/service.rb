ActiveAdmin.register Service do

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :position
      f.input :main
      f.input :title
      f.input :key
      f.input :price
    end
    f.inputs  do
      f.input :summary
    end

    #f.has_many :images do |image|
      #image.input :file
      #image.input :description
    #end
    f.actions
  end

  index do
    column :id
    column :title
    column :key
    column :price do |page|
      page.price.html_safe
    end
    column :summary do |page|
      truncate_html page.summary.html_safe
    end
    actions
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params *Service.attribute_names
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
