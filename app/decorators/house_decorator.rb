class HouseDecorator < Draper::Decorator
  delegate_all

  def css_class
    resort.highlighted? ? 'warning' : ''
  end

  def rooms_count
    if source.rooms_count.present? && source.rooms_count >0
      "#{source.rooms_count}"
    else
      "-"
    end
  end

  def main_title
    title = source.accusative_title.present? ? source.accusative_title : source.title
    "Снять #{title}"
  end

  def admin_link
    h.link_to 'edit', h.edit_admin_house_url(source), class: 'btn btn-small btn-warning' if h.current_user.present? && h.current_user.can_create?(source)
  end

  def common_image *options
    h.image_tag(source.preview.file.common.url, *options) if source.preview.present?
  end

  def basic_image *options
    h.image_tag(source.preview.file.basic.url, *options) if source.preview.present?
  end

  def preview_image *options
    h.image_tag(source.preview.file.thumb.url, *options) if source.preview.present?
  end

  def title
    source.title? ? source.title : source.resort.title
  end

  def tags_block
    h.tag_list source.tags
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
    source.capacity.present? ? "#{source.capacity} чел." : "-"
  end

  def distance
    h.distance source.distance
  end

  def transfer_price
    price = 2 * resort.distance * Settings.services.transport
    h.number_with_precision(price, precision: 0, delimiter: ' ')
  end

  def time
    "#{source.time} мин."
  end

  def resort_price_range
    source.resort.price_range.present? ? source.resort.price_range : '-'
  end

  def resort_site
    source.resort.site.present? ? h.link_to(source.resort.site, source.resort.site, rel: 'nofollow', target: '_blank') : '-'
  end

  def resort_distance
    source.resort.distance.present? ? source.resort.distance : '-'
  end

end
