class OrdersController < ApplicationController

  def show
    @order = OrderDecorator.new Order.find(params[:id])
  end

end
