class PhotoOrderSMS < OrderSMS
  def self.sms order, phone
    order = OrderDecorator.new order
    send_sms "Заказ №#{order.id}. Фото. Время визита: #{order.human_time}. #{order.name} #{order.phone}. #{order.admin_url}", phone
  end
end
