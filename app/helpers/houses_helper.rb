module HousesHelper
  def tag_list tags
    tags.map do |tag|
      link_to tag.name, "#"
    end.join("&nbsp;").html_safe
  end
end
