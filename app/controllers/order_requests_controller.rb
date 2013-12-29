class OrderRequestsController < OrdersController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new order_params

    if @order.save
      #NotificationService.new.new_order(@order)
      redirect_to root_path
    else
      render :new
    end
  end


end
