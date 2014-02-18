class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id]).decorate
  end

end
