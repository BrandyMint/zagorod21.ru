class HousesController < ApplicationController
  def index
    @houses = House.ordered
  end

  def show
    @house = HouseDecorator.new House.find params[:id]
  end
end
