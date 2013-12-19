ActiveAdmin.register Image do

  show do |image|
    attributes_table do
      row :resource
      row :description
      Image.first.file.versions.keys.each do |version|
        row version do
          div do
            image_tag image.file.send(version).url
          end
          div do
            image.file.send(version).size
          end
        end
      end
    end
    active_admin_comments
  end

  index as: :grid, columns: 5 do |image|
    div :for => image do
      h3 do
        link_to image.resource, admin_resource_url(image.resource)
      end
      div do
        link_to admin_image_url(image) do
          image_tag image.file.thumb.url
        end
      end
      div do
        image_preview_link(image, resource)
      end if resource.present?
    end

    
  end

  sidebar :upload_images, :only => :index do
    render "mass_upload_form"
  end

  form do |f|
    f.inputs do
      f.input :resource_type
      f.input :resource_id
      f.input :file
      f.input :description
    end

    f.actions
  end

  member_action :set_preview, :method => :put do
    resource = params[:resource_type].constantize
    item = resource.find params[:resource_id]
    item.update_attributes(preview_id: params[:id])
    redirect_to admin_images_url(q: { resource_type_eq: item.class.to_s, resource_id_eq: item.id}), notice: "Превью установлено"
  end

  controller do
    def index
      @resource = params[:q][:resource_type_eq].constantize.find params[:q][:resource_id_eq] if resource_filter?
      super
    end

    private
    def resource_filter?
      params[:q].present? &&
      params[:q][:resource_type_eq] &&
      params[:q][:resource_id_eq]
    end
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params *Image.attribute_names
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
end
