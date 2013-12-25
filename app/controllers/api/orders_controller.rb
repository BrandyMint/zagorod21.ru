class Api::OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token  

  def estimate
    @esimation = HouseCalculator.new(house, form_object).estimate if form_object.valid? && house
    render json: response_data
  end

private
  def response_data
    (@esimation && @esimation.total) ? jsend_success : jsend_fail
  end

  def jsend_success
    {
      status: 'success',
      data: {total: @esimation.total.round}
    }
  end

  def jsend_fail
    {
      status: 'error',
      message: "Невозможно рассчитать стоимость"
    }
  end

  def house
    House.find params[:order][:house_id] if params[:order] && params[:order][:house_id] 
  end

  def form_object
    SearchForm.new order_params
  end

  def order_params
    params[:order].permit(:date_from, :date_to, :use_transport, :food_state) if params[:order]
  end
end