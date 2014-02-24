module HousesHelper
  def tag_list tags
    buffer = ''
    size = (tags.size/2).round
    size = size > 0 ? size : 1
    tags.each_slice(size).each do |tag_block|
      items = tag_block.map do |tag|
        content_tag(:li, tag)
      end.join.html_safe
      buffer << content_tag(:ul, items, class: 'tags col-xs-6 size-12px-m')
    end
    buffer.html_safe
  end
end
