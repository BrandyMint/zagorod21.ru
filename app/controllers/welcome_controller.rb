class WelcomeController < ApplicationController
  PER_PAGE = 8

  def index
    hsq = HouseSearchQuery.new search_form, sort_form
    @all_houses = House.all.count
    @matched_houses = hsq.estimates.count
    @estimates = Kaminari.paginate_array(hsq.estimates).page(params[:page]).per(PER_PAGE)
    render layout: 'application_wide'
  end

  def contact

  end

end
