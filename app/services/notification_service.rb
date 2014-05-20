class NotificationService

  def initialize order
    raise StandardError if order.blank?
    @order = order
  end

  def notify
    AdminUser.order_notify.each do |admin|
      send_sms admin.phone
      send_email admin.email
    end
  end

  private

  def send_sms phone
    "#{order_type}SMS".constantize.sms @order, phone
  end

  def send_email email
    OrderMailer.send("#{order_type.underscore}_email", @order, email).deliver
  end

  def order_type
    @order.class.name
  end

end
