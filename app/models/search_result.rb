class SearchResult
  attr_accessor :all_houses, :matched_houses, :page, :estimates

  def initialize search_form, sort_form, options={}
    @search_form = search_form
    @sort_form = sort_form
    @options = options

    @page = @options[:page] || 1
    @search_form.selected = @options.fetch(:selected, nil)
    perform
  end

  def perform
    hsq = HouseSearchQuery.new(@search_form, @sort_form).estimates

    @all_houses = House.by_category(@search_form.category).includes(:resort).active.count
    @matched_houses = hsq.count
    @estimates = Kaminari.paginate_array(hsq).page(@page).per @options.fetch(:show, ApplicationController::HOUSES_PER_PAGE)
  end

  def present?
    @estimates.present?
  end
end
