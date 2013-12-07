class OrdersController < ApplicationController
  def create
    @order = Order.create order_params
  end

  private

  def order_params
    params[:order].permit(:name, :date_from, :date_to, :house_id, :phone)
  end
end
