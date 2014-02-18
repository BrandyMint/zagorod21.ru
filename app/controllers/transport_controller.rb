class TransportController < ApplicationController

  def index
    @transport_order ||= TransportOrder.new
    render
  end

  def show
    # @transport_order = Order.find params[:id]
    render 'index'
  end

  def create
    @transport_order = TransportOrder.new order_params

    if @transport_order.save
      # NotificationService.new.new_order(@transport_order)
      redirect_to transport_index_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:transport_order).permit!
  end

end
