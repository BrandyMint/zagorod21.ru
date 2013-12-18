class OrdersController < ApplicationController
  def create
    @order = Order.new order_params

    if @order.save
      NotificationService.new.new_order(@order)
      redirect_to order_path(@order)
    else
      @house = @order.house
      render :edit
    end
  end

  def show
    @order = Order.find params[:id]
  end

  private

  def order_params
    params[:order].permit(:name, :date_from, :date_to, :house_id, :phone, :people_quantity, :money_amount)
  end
end
