class RentOrderSMS < OrderSMS
  def self.sms order, phone
    order = OrderDecorator.new order
    send_sms "Заказ №#{order.id}. #{order.name} предлагает аренду. #{order.phone}. #{order.admin_url}", phone
  end
end
