module HousesHelper
  def tag_list tags
    content_tag(:ul, '', class: 'col-xs-6 size-12px-m') <<
    tags.map do |tag|
      content_tag(:li, tag)
    end.join.html_safe
  end
end
