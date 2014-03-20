module ApplicationHelper
  def app_version
    content_tag :span, :data => { :version => Zagorod.version.to_s } do
      'v' + Zagorod.version.format( "%M.%m.%p" )
    end
  end

  def sortable_column column
    column = column.to_s
    label = House.human_attribute_name(column)

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
    order=='asc' ? '&darr;' : '&uarr;'
  end

  def people_quantity_collection house=nil
    return [1] if House.count==0

    min = House.min_people_capacity
    max = house.present? ? house.capacity : House.max_people_capacity
    collection = {'неизвестно' => ''}
    for i in min..max
      g = "чел."
      caption = "#{i} #{g}"
      collection[caption] = i
    end
    collection
  end

  def prices_collection
    prices = {'любая' => ''}
    prices.merge!( Settings.default.prices.inject({}) {|hsh, price| hsh["до #{price} р./сутки"] = price; hsh} )
    prices["свыше #{prices.values.last} р./сутки"] = :max
    prices
  end

  def food_states_collection
    [
      [I18n.t('order.food_state.none'), 'none'],
      [I18n.t('order.food_state.inplace', price: Settings.services.food_inplace), 'inplace'],
      [I18n.t('order.food_state.catering', price: Settings.services.food_catering), 'catering']
    ]
  end

  def money price
    return '-' if price.nil?

    "<nowrap>#{number_to_currency price, precision: 0}</nowrap>".html_safe
  end

  def formatted_price price
    number_with_precision(price, precision: 0, delimiter: ' ')
  end

  def distance dist
    "#{number_with_precision dist, precision: 0} км"
  end

  def current_city
    session[:current_city]
  end

  def houses_view_mode
    session[:houses_view_mode]
  end

  def search_form
    @search_form ||= SearchForm.new params[:search_form]
    @search_form.city = current_city
    session[:search_form] = @search_form
  end

  def sort_form
    @sort_form ||= SortForm.new params[:sort_form]
    session[:sort_form] = @sort_form
  end

  def more_houses
    unless request.url.include?('houses')
      "<div class=\"row\">
        <div class=\"col-xs-12 col-md-4 col-md-offset-4\">
          <a href=\"#{houses_path}\" class=\"btn btn-default btn-lg btn-block more-btn\">Показать ещё</a>
        </div>
      </div>".html_safe
    end
  end

  def current_url(overwrite={}, only='')
    new_params = {}
    old_params = only.present? ? params.slice(only) : params
    url_for :only_path => false, :params => new_params.merge(old_params).merge(overwrite)
  end
end
