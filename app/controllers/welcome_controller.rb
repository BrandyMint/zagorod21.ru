class WelcomeController < ApplicationController

  def index
    search_for_houses
    render layout: 'application_wide'
  end

  def houses_rows
    search_for_houses
    render layout: false
  end

  def contact

  end

private
  def search_for_houses
    hsq = HouseSearchQuery.new search_form, sort_form
    @all_houses = House.includes(:resort).active.count
    @matched_houses = hsq.estimates.count
    @page = params[:page] ? params[:page] : 1
    @estimates = Kaminari.paginate_array(hsq.estimates).page(@page).per(HOUSES_PER_PAGE)
  end

end
