class OrdersController < ApplicationController

  def show
    @search_result = SearchResult.new search_form, sort_form, {show: 3, selected: true}
    @order = OrderDecorator.new Order.find(params[:id])
  end

end
