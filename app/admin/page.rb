ActiveAdmin.register Page do
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :carousel
      f.input :title
      f.input :slug
      f.input :body, as: :html_editor
      f.input :template, collection: Page.all.map(&:slug)
    end

    f.actions
  end

  index do
    column :id
    column :preview do |page|
      image_tag page.preview.file.thumb.url if page.preview.present?
    end
    column :slug
    column :title
    column :body do |page|
      truncate_html page.body.html_safe
    end
    column :carousel
    column :images do |page|
      ul do
        li link_to "Картинки #{page.images.count}", admin_resource_images_url(page)
        li link_to "Добавить", new_admin_image_url(image: { resource_type: 'Page', resource_id: page.id})
      end
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
