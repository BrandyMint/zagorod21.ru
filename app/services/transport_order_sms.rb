class TransportOrderSMS < OrderSMS
  def self.sms order, phone
    order = OrderDecorator.new order
    send_sms "Заказ №#{order.id}. Транспорт. Заезд: #{order.date_from_day}. Выезд: #{order.date_to_day}. #{order.people_quantity} человек. #{order.name} #{order.phone}. #{order.admin_url}", phone
  end
end
