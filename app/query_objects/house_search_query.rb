class HouseSearchQuery

  def initialize form_object, sort_form
    @form_object = form_object
    @sort_form = sort_form

    @scope = default_scope
    add_sorting
    add_filters
  end

  def estimates
    houses.map do |h|
      HouseCalculator.new( h, @form_object ).estimate
    end
  end

  def houses
    scope
  end

  private

  def default_scope
    House.from(@form_object.city).active
  end

  def scope
    @scope
  end

  def add_sorting
    @scope = if @sort_form.valid?
      @scope.order "#{sql_column} #{@sort_form.order}"
    else
      default_sort
    end
  end

  def default_sort
    @scope.order("price_bd ASC").order("resorts.highlighted DESC")
  end

  def sql_column
    if @sort_form.column == 'price'
      'price_bd'
    elsif @sort_form.column == 'distance'
      'resorts.distance'
    else
      @sort_form.column
    end
  end

  def add_filters
    @scope = people_filter if @form_object.people_quantity.present?
    @scope = price_filter if @form_object.price_to.present?
    @scope = comfort_filter if @form_object.comfort.try(:join).present?
    @scope = selected_filter if @form_object.selected.present?
    @scope
  end

  def people_filter
    @scope.where('capacity >= ?', @form_object.people_quantity)
  end

  def price_filter
    if @form_object.price_to.to_sym == :max
      condition = '>='
      price = Settings.default.prices.last
    else
      condition = '<'
      price = @form_object.price_to.to_i
      price = Settings.default.prices.include?(price) ? price : Settings.default.prices.last
    end

    field = covers_weekend? ? 'price_wd' : 'price_bd'
    @scope.where("#{field} #{condition} ?", price)
  end

  def comfort_filter
    @scope.tagged_with(@form_object.comfort, :any => true)
  end

  def selected_filter
    @scope.selected
  end

  private

  def covers_weekend?
    (@form_object.date_from..@form_object.date_to).any?(&:is_weekend?) if @form_object.date_from.present?
  end

end
