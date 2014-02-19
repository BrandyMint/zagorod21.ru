class FoodController < ApplicationController

  def index
    @food_order ||= FoodOrder.new
    render
  end

  def show
    # @food_order = Order.find params[:id]
    render 'index'
  end

  def create
    @food_order = FoodOrder.new order_params

    if @food_order.save
      # NotificationService.new.new_order(@food_order)
      redirect_to order_path(@food_order)
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:food_order).permit!
  end

end
