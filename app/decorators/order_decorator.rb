class OrderDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all

  def stay_dates
    "с #{date_from_day} по #{date_to_day}"
  end

  def date_from_day
    I18n.l object.date_from, format: :dots_separated
  end

  def date_to_day
    I18n.l object.date_to, format: :dots_separated
  end

  def human_time
    I18n.l object.date_from, format: :timepicker
  end

  def money_amount
    h.money object.money_amount
  end

  def house
    object.house.title
  end

  def resort
    object.house.resort.title
  end

  def admin_url
    admin_order_url object
  end

  def view_phone
    "+7 (#{phone[0,3]}) #{phone[3,3]}-#{phone[6,2]}-#{phone[8,2]} "
  end
end