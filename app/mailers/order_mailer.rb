class OrderMailer < BaseMailer
  def new_order_for_admin order
    @order = order
    @house = order.house
    @site = Settings.app.default_url_options.host
    mail(subject: "Новый заказ на сайте #{@site}")
  end
end