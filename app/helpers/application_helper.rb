module ApplicationHelper
  def people_quantity_collection house
    max = house.present? ? house.capacity : Resort.max_people_capacity
    1..max
  end

  def format_money price
    return '-' if price.nil?

    if price>1000
      "#{number_to_human(price/1000)} тыс.руб."
    else
      "#{price.to_i} руб."
    end

  end
end
