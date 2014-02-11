class HousesController < ApplicationController
  def index
    hsq = HouseSearchQuery.new search_form, sort_form
    @estimates = Kaminari.paginate_array(hsq.estimates).page(params[:page]).per(HOUSES_PER_PAGE)
  end

  def show
    @house = HouseDecorator.new House.find params[:id]
  end

end
