# -*- coding: utf-8 -*-
# configures your navigation

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :houses_url, 'Дома', houses_url
    primary.item :transport_url, 'Транспорт', page_url(:transport)
    primary.item :food_url, 'Еда', page_url(:food)
    primary.item :rent_url, 'Сдать дом в аренду', page_url(:rent)
    # primary.item :feedback, 'Отзывы', feedback_url

    # if current_admin_user.present?
    #   primary.item :admin, 'Админка', admin_root_url, class: 'visible-lg'
    # end

    primary.dom_class = 'nav navbar-nav navbar-right'

    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end
end
