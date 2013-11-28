class ResortsController < ApplicationController
  def index
    @resorts = Resort.ordered
  end

  def show
    @resort = ResortDecorator.new Resort.find params[:id]

    @houses = @resort.houses.ordered
  end
end
