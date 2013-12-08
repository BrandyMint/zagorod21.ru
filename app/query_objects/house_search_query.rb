class HouseSearchQuery

  def initialize form_object, sort_form
    @form_object = form_object
    @sort_form = sort_form

    @scope = default_scope
    add_sorting
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
    House.includes(:resort).ordered
  end

  def scope
    @scope
  end

  def add_sorting
    if @sort_form.valid?
      @scope = @scope.order "#{sql_column} #{@sort_form.order}"
    end
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

end
