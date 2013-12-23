class OrdersController < ApplicationController
  def create
    @order = Order.new order_params

    if @order.save
      NotificationService.new.new_order(@order)
      redirect_to order_path(@order)
    else
      @house = @order.house.decorate
      render 'houses/show'
    end
  end

  def show
    @order = Order.find(params[:id]).decorate
  end

  private

  def order_params
    params_with_clean_phone.permit(:name, :phone, :email, :date_from, :date_to, :house_id,  :people_quantity, :money_amount, :food_state, :use_transport)
  end

  def params_with_clean_phone
    raw_phone = params[:order][:phone]
    clean_phone = raw_phone[4,3] + raw_phone[9,3] + raw_phone[13,2] + raw_phone[16,2]
    params[:order].merge(phone: clean_phone)
  end
end
