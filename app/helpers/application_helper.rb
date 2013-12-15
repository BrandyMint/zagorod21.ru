module ApplicationHelper
  def app_version
    content_tag :span, :data => { :version => Zagorod.version.to_s } do
      'v' + Zagorod.version.format( "%M.%m.%p" )
    end
  end

  def sortable_column column
    column = column.to_s
    label = I18n.t column, scope: :sortable_columns

    new_sort_form = sort_form.dup
    new_sort_form.column = column
    new_sort_form.reverse_order!

    if sort_form.column == column
      label << order_icon(new_sort_form.order)
    end

    link_to label.html_safe, url_for(sort_form: new_sort_form, search_form: search_form)
  end

  def order_icon order
    return '' if order.blank?
    order=='asc' ? '&uarr;' : '&darr;'
  end

  def people_quantity_collection house=nil
    min = House.min_people_capacity
    max = house.present? ? house.capacity : House.max_people_capacity
    collection = {}
    for i in min..max
      g = "чел."
      caption = "#{i} #{g}"
      collection[caption] = i
    end
    collection
  end

  def food_states_collection
    [
      ['без заказного питания', 'none'],
      ["готовка на месте (от #{Settings.services.food_inplace} в день)", 'inplace'],
      ["выездное питание (от #{Settings.services.food_catering} за блюдо)", 'catering']
    ]
  end

  def money price
    return '-' if price.nil?

    "<nowrap>#{number_to_currency price, precision: 0}</nowrap>".html_safe
  end
end
