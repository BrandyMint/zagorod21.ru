ActiveAdmin.register Page do
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :slug
      f.input :body, as: :html_editor
    end

    f.actions
  end
  permit_params *Page.attribute_names
end