module ApplicationHelper
  def people_quantity_collection house=nil
    min = House.min_people_capacity
    max = house.present? ? house.capacity : House.max_people_capacity
    1..max
  end

  def money price
    return '-' if price.nil?

    "<nowrap>#{number_to_currency price, precision: 0}</nowrap>".html_safe
  end
end
