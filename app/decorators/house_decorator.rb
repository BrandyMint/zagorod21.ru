class HouseDecorator < Draper::Decorator
  delegate_all

  def css_class
    resort.highlighted? ? 'warning' : ''
  end

  def house_css_class
    object.selected? ? 'warning' : ''
  end

  def rooms_count
    if object.rooms_count.present? && object.rooms_count >0
      "#{object.rooms_count}"
    else
      "-"
    end
  end

  def main_title
    title = object.accusative_title.present? ? object.accusative_title : object.title
    "Снять #{title}"
  end

  def admin_link
    h.link_to 'edit', h.edit_admin_house_url(object), class: 'btn btn-small btn-warning' if h.current_user.present? && h.current_user.can_create?(object)
  end

  def common_image *options
    h.image_tag(object.preview.file.common.url, *options) if object.preview.present?
  end

  def basic_image *options
    h.image_tag(object.preview.file.basic.url, *options) if object.preview.present?
  end

  def preview_image *options
    h.image_tag(object.preview.file.thumb.url, *options) if object.preview.present?
  end

  def small_image *options
    h.image_tag object.preview.file.url(:small), width: 60, height: 60 if object.preview.present?
  end

  def title
    object.title? ? object.title : object.resort.title
  end

  def tags_block
    h.tag_list object.tags
  end

  def price
    if object.price_bd == object.price_wd
      price_bd
    else
      h.content_tag :span, class: :money do
        h.number_with_precision(object.price_bd, precision: 0, delimiter: ' ') + '-' +
          price_wd
      end
    end
  end

  def price_bd
    h.money object.price_bd
  end

  def price_wd
    h.money object.price_wd
  end

  def price_bd_hour
    h.money object.price_bd_hour
  end

  def capacity
    object.capacity.present? ? "#{object.capacity} чел." : "-"
  end

  def distance
    h.distance object.distance
  end

  def transfer_price
    price = 2 * resort.distance * Settings.services.transport
    h.number_with_precision(price, precision: 0, delimiter: ' ')
  end

  def time
    "#{object.time} мин."
  end

  def resort_price_range
    object.resort.price_range.present? ? object.resort.price_range : '-'
  end

  def resort_site
    object.resort.site.present? ? h.link_to(object.resort.site, object.resort.site, rel: 'nofollow', target: '_blank') : '-'
  end

  def resort_distance
    object.resort.distance.present? ? object.resort.distance : '-'
  end

  def category_icon
    "<i class=\"fontello-icon-home-1\"></i>".html_safe
  end

end
