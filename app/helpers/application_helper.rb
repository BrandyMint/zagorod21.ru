module ApplicationHelper
  def people_quantity_collection house=nil
    min = House.min_people_capacity
    max = house.present? ? house.capacity : House.max_people_capacity
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
