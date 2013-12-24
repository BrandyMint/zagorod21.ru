class OrderDecorator < Draper::Decorator
  delegate_all

  def transport
    use_transport ? "Трансфер включен" : "Без трансфера" 
  end

  def food
    price = Settings.services.send("food_#{food_state}") unless food_state == 'none'
    I18n.t("order.food_state.#{food_state}", price: price)
  end

  def stay_dates
    from =  I18n.l date_from, format: :dots_separated
    to =  I18n.l date_to, format: :dots_separated
    "с #{from} по #{to}"
  end

  def view_phone
    "+7 (#{phone[0,3]}) #{phone[3,3]}-#{phone[6,2]}-#{phone[8,2]} "
  end
end