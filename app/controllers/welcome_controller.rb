class WelcomeController < ApplicationController
  PER_PAGE = 25

  def index
    hsq = HouseSearchQuery.new search_form, sort_form
    @estimates = Kaminari.paginate_array(hsq.estimates).page(params[:page]).per(PER_PAGE)
    render layout: 'application_wide'
  end

  def contact

  end

end
