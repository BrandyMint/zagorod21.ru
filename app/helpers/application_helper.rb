module ApplicationHelper
  def format_money price

    return '-' if price.nil?

    if price>1000
      "#{number_to_human(price/1000)} тыс.руб."
    else
      "#{price.to_i} руб."
    end

  end
end
