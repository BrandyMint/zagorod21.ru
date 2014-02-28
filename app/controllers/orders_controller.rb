class OrdersController < ApplicationController

  include Concerns::HouseSearchConcern

  def show
    search_for_houses show: 3, selected: true
    @order = OrderDecorator.new Order.find(params[:id])
  end

end
