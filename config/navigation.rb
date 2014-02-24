# -*- coding: utf-8 -*-
# configures your navigation

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :resorts, 'Дома', houses_url
    primary.item :resorts, 'Транспорт', transport_index_url
    primary.item :resorts, 'Еда', food_index_url
    # primary.item :services, 'Услуги', page_path(slug: 'services')
    # primary.item :feedback, 'Отзывы', feedback_url

    if current_admin_user.present?
      primary.item :admin, 'Админка', admin_root_url, class: 'visible-lg'
    end

    primary.dom_class = 'nav navbar-nav navbar-right'

    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end
end
