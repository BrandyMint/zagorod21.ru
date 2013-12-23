class NotificationService
  include Rails.application.routes.url_helpers

  def new_order order
    send_sms new_order_message(order)
    new_order_email(order)
  end

  private

  def new_order_email order
    OrderMailer.new_order_for_admin(order).deliver 
  end

  def new_order_message order
    from = I18n.l order.date_from, format: :dots_separated
    to = I18n.l order.date_to, format: :dots_separated
    site = Settings.app.default_url_options.host
    resort = order.house.resort.title
    admin_url = Settings.app.base_url + admin_order_path(order)
    "#{site} заказ №#{order.id}. База #{resort}. Пребывание с #{from} по #{to} на #{order.people_quantity} человек. #{admin_url}"
  end

  def send_sms message, phone=Settings.sms_phone
    LittleSms.send_sms(phone, message)
  end
end
