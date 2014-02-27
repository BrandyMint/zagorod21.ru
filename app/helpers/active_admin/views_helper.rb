module ActiveAdmin::ViewsHelper
  def admin_resource_url resource
    if resource.is_a? House
      admin_house_url resource
    elsif resource.is_a? Resort
      admin_resort_url resource
    elsif resource.is_a? Page
      admin_page_url resource
    else
      raise "Unknown resource #{resource}"
    end
  end

  def admin_resource_images_url resource
    admin_images_url(q: { resource_type_eq: resource.class.to_s, resource_id_eq: resource.id})
  end

  def image_preview_link image, resource
    if image.preview_of?(resource)
      "Превью"
    else
      link_to "Установить как превью", set_preview_admin_image_path(image, resource_type: resource.class.to_s, resource_id: resource.id), method: :put
    end
  end
end
