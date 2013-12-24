class HouseDecorator < Draper::Decorator
  delegate_all

  def css_class
    resort.highlighted? ? 'warning' : ''
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

  def title
    source.title? ? source.title : source.resort.title
  end

  def price
    if source.price_bd == source.price_wd
      price_bd
    else
      h.content_tag :span, class: :money do
        h.number_with_precision(source.price_bd, precision: 0, delimiter: ' ') + '-' +
          price_wd
      end
    end
  end

  def price_bd
    h.money source.price_bd
  end

  def price_wd
    h.money source.price_wd
  end

  def price_bd_hour
    h.money source.price_bd_hour
  end

  def capacity
    "#{source.capacity} чел."
  end

  def distance
    h.distance source.distance
  end

  def time
    "#{source.time} мин."
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
