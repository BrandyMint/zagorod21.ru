module HousesHelper
  def tag_list tags
    buffer = ''
    tags.each_slice( (tags.size/2).round ).each do |tag_block|
      items = tag_block.map do |tag|
        content_tag(:li, tag)
      end.join.html_safe
      buffer << content_tag(:ul, items, class: 'col-xs-6 size-12px-m')
    end
    buffer.html_safe
  end
end
