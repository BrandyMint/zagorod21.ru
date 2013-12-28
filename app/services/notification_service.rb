class NotificationService
  include Rails.application.routes.url_helpers

  def new_order order
    AdminUser.order_notify.each do |admin|
      send_sms new_order_message(order), admin.phone
      new_order_email(order, admin.email)
    end
  end

  private

  def new_order_email order, email
    OrderMailer.new_order_for_admin(order, email).deliver 
  end

  def new_order_message order
    from = I18n.l order.date_from, format: :dots_separated
    to = I18n.l order.date_to, format: :dots_separated
    resort = order.house.resort.title
    house = order.house.title

    # TODO перенести base_url в роуты
    admin_url = admin_order_url(order)
    "Заказ №#{order.id}. #{resort} (#{house}). Пребывание с #{from} по #{to} на #{order.people_quantity} человек. #{order.name} #{order.phone}. #{admin_url}"
  end

  def send_sms message, phone=Settings.sms_phone
    params = Rails.env == 'production' ? {} : {test: 1}
    Rails.logger.info "SEND SMS: #{phone}: #{message}"
    LittleSms.send_sms(phone, message, params)
  end
end
