class PagesController < ApplicationController

  def index
    @page ||= Page.find_by_slug(params[:slug])
    return not_found unless @page.present?

    @order ||= Order.new order_params
    render @page.template if @page.template.present?
  end

  def create
    @order = Order.new order_params

    if @order.save
      NotificationService.new(@order).notify
      redirect_to order_path(@order)
    else
      @order = @order.becomes(Order)
      index
    end
  end

  private

  def order_params
    params.fetch(:order, {}).permit!
  end
end
