ActiveAdmin.register Cora::Phrase do

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :locale, allow_blank: false, collection: [:en, :ru] # TODO cora_available_locales
      f.input :key
      f.input :value
    end
    f.actions
  end


  permit_params *Cora::Phrase.attribute_names
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
