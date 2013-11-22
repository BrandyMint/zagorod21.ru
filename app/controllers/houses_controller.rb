class HousesController < ApplicationController
  def index
    @houses = House.ordered
  end

  def show
    @house = HouseDecorator.new House.find params[:id]

    redirect_to resort_url @house.resort, anchor: "house_#{@house.id}"
  end
end
