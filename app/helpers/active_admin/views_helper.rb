module ActiveAdmin::ViewsHelper
  def admin_resource_url resource
    if resource.is_a? House
      admin_house_url resource
    elsif resource.is_a? Resort
      admin_resort_url resource
    else
      raise "Unknown resource #{resource}"
    end
  end
end
