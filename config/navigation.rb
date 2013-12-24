# -*- coding: utf-8 -*-
# configures your navigation

SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :resorts, 'Базы отдыха', resorts_url
    primary.item :services, 'Услуги', page_path(slug: 'services')
    #primary.item :feedback, 'Отзывы', feedback_url
    #primary.item :feedback, 'Контакты', contact_url

    primary.dom_class = 'nav navbar-nav pull-right'

    # you can turn off auto highlighting for a specific level
    primary.auto_highlight = true
  end
end
