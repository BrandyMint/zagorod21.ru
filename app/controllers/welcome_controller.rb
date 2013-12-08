class WelcomeController < ApplicationController
  def index
    hsq = HouseSearchQuery.new search_form, sort_form
    @estimates = hsq.estimates
  end

  def contact

  end

end
