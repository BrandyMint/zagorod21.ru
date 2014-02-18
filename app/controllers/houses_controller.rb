class HousesController < ApplicationController

  include Concerns::HouseSearchConcern

  def index
    search_for_houses
  end

  def show
    @house_order ||= HouseOrder.new
    @house = HouseDecorator.new House.find params[:id]
  end

  def create
    @house_order = HouseOrder.new order_params

    if @house_order.save
      NotificationService.new.new_order(@house_order)
      redirect_to order_path(@house_order)
    else
      redirect_to :back
    end
  end

  private

  def order_params
    params.require(:house_order).permit!
  end

end
