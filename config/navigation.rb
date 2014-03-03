# -*- coding: utf-8 -*-
# configures your navigation

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :houses_url, 'Дома', houses_url
    primary.item :transport_url, 'Транспорт', transport_index_url
    primary.item :food_url, 'Еда', food_index_url
    primary.item :rent_url, 'Сдать дом в аренду', rent_index_url
    # primary.item :feedback, 'Отзывы', feedback_url

    # if current_admin_user.present?
    #   primary.item :admin, 'Админка', admin_root_url, class: 'visible-lg'
    # end

    primary.dom_class = 'nav navbar-nav navbar-right'

    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end
end
