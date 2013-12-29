ActiveAdmin.register BookedPeriod do

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :house, include_blank: false
      f.input :date_from
      f.input :date_to
      f.input :state, collection: BookedPeriod.states, include_blank: false
    end

    f.actions
  end

  permit_params *BookedPeriod.attribute_names

end
