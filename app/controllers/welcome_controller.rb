class WelcomeController < ApplicationController

  def index
    hsq = HouseSearchQuery.new search_form, sort_form
    @all_houses = House.includes(:resort).active.count
    @matched_houses = hsq.estimates.count
    @page = params[:page] ? params[:page] : 1
    @estimates = Kaminari.paginate_array(hsq.estimates).page(@page).per(HOUSES_PER_PAGE)

    respond_to do |format|
      format.html {render layout: 'application_wide'}
      format.js {render}
    end
  end

  def contact

  end

end
