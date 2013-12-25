class HousesController < ApplicationController
  def index
    hsq = HouseSearchQuery.new search_form, sort_form
    @houses = Kaminari.paginate_array(hsq.houses).page(params[:page]).per(HOUSES_PER_PAGE)
  end

  def show
    @house = HouseDecorator.new House.find params[:id]
  end

end
