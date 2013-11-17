class HousesController < ApplicationController
  def index
    @houses = House.ordered
  end

  def show
    @house = House.find params[:id]
  end
end
