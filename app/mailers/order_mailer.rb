class OrderMailer < BaseMailer
  def house_order_email order, email
    @house = order.house
    @order = OrderDecorator.new order
    @site = Settings.app.default_url_options.host
    mail(to: email, subject: "Заказ дома на сайте #{@site}")
  end

  def rent_order_email order, email
    @order = OrderDecorator.new order
    @site = Settings.app.default_url_options.host
    mail(to: email, subject: "Предложение аренды на сайте #{@site}")
  end

  def food_order_email order, email
    @order = OrderDecorator.new order
    @site = Settings.app.default_url_options.host
    mail(to: email, subject: "Заказ еды на сайте #{@site}")
  end

  def transport_order_email order, email
    @order = OrderDecorator.new order
    @site = Settings.app.default_url_options.host
    mail(to: email, subject: "Заказ транспорта на сайте #{@site}")
  end

  def photo_order_email order, email
    @order = OrderDecorator.new order
    @site = Settings.app.default_url_options.host
    mail(to: email, subject: "Заказ фото на сайте #{@site}")
  end
end
