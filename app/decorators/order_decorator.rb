class OrderDecorator < Draper::Decorator
  delegate_all

  def stay_dates
    from = I18n.l source.date_from, format: :dots_separated
    to = I18n.l source.date_to, format: :dots_separated
    "с #{from} по #{to}"
  end

  def date_from_day
    I18n.l source.date_from, format: :dots_separated
  end

  def money_amount
    h.money source.money_amount
  end

  def view_phone
    "+7 (#{phone[0,3]}) #{phone[3,3]}-#{phone[6,2]}-#{phone[8,2]} "
  end
end