class HouseOrderSMS < OrderSMS
  def self.sms order, phone
    order = OrderDecorator.new order
    send_sms "Заказ №#{order.id}. #{order.resort} (#{order.house}). Пребывание с #{order.date_from_day} по #{order.date_to_day} на #{order.people_quantity} человек. #{order.name} #{order.phone}. #{order.admin_url}", phone
  end
end