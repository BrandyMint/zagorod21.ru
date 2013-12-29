module HousesHelper
  def tag_list tags
    html = ""

    tags.each do |tag|
      html += link_to "#{tag.name}&nbsp;".html_safe, "#"
    end

    html.html_safe
  end

end
