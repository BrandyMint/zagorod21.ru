ActiveAdmin.register Page do
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :slug
      f.input :body
    end

    f.actions
  end

  index do
    column :id
    column :slug
    column :title
    column :body do |page|
      truncate_html page.body.html_safe
    end
    actions
  end

  show do
    h3 page.title
    h4 page.slug
    div do
      page.body.html_safe
    end
  end

  permit_params *Page.attribute_names
end
