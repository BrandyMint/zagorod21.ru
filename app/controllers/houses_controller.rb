class HousesController < ApplicationController

  include Concerns::HouseSearchConcern

  def index
    search_for_houses
  end

  def show
    @house = HouseDecorator.new House.find params[:id]
  end

end
