ActiveAdmin.register Resort do

  index do
    column :preview do |resort|
      image_tag resort.preview.file.thumb.url if resort.preview.present?
    end
    column :title
    column :houses_count do |resort|
      link_to "Домов: #{resort.houses.count}", admin_houses_url(q: { resort_id_eq: resort.id})
    end
    actions

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
