class HousesController < ApplicationController
  def index
    hsq = HouseSearchQuery.new search_form, sort_form
    @houses = hsq.houses
  end

  def show
    @house = HouseDecorator.new House.find params[:id]
  end

end
