class ResortDecorator < Draper::Decorator
  delegate_all

  def button
    h.link_to label, h.resort_url(source)
  end

  def distance
    h.distance source.distance
  end

  def price
    prices = (houses.map(&:price_bd) + houses.map(&:price_wd)).compact.uniq.sort

    if prices.count > 1
      "#{h.formatted_price(prices.first)} - #{h.money(prices.last)}".html_safe
    else
      h.formatted_price(prices.last)
    end
  end

  def common_image
    h.image_tag source.preview.file.common.url if source.preview.present?
  end

  def basic_image
    h.image_tag source.preview.file.basic.url if source.preview.present?
  end

  def preview_image
    h.image_tag source.preview.file.thumb.url if source.preview.present?
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
