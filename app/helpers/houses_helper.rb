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

  def view_mode_switch
    str = ''
    if houses_view_mode == 'table'
      str << link_to( "<span class=\"fontello-icon-th-list\"></span>".html_safe, current_url({view: :table}, :search_form), class: "btn btn-success btn-filter-collapse", title: I18n.t('viewmode.table') )
      str << link_to( "<span class=\"fontello-icon-th-large\"></span>".html_safe, current_url({view: :blocks}, :search_form), class: "btn btn-default btn-filter-collapse", title: I18n.t('viewmode.blocks') )
    else
      str << link_to( "<span class=\"fontello-icon-th-list\"></span>".html_safe, current_url({view: :table}, :search_form), class: "btn btn-default btn-filter-collapse", title: I18n.t('viewmode.table') )
      str << link_to( "<span class=\"fontello-icon-th-large\"></span>".html_safe, current_url({view: :blocks}, :search_form), class: "btn btn-success btn-filter-collapse", title: I18n.t('viewmode.blocks') )
    end
    str.html_safe
  end

  def sortable_th attribute
    House.human_attribute_name(attribute)
  end
end
