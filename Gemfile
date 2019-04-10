source 'https://rubygems.org'

gem 'puma'
gem 'rails', '~> 5.2'

# Use postgresql as the database for ActiveRecord
gem 'pg'

gem 'settingslogic'

gem 'sanitize'

gem 'truncate_html'

gem "fotoramajs", "~> 4.4.8"
gem 'tinymce-rails'


gem 'activeadmin', github: 'gregbell/active_admin'

# Авторизация и аутентификация
gem 'authority'
# gem 'rolify'

# Управление версиями проекта
gem 'semver2'

gem 'meta-tags', :require => 'meta_tags'
#gem 'phrasing', :git => 'git://github.com/BrandyMint/phrasing.git'

# Модели, value object и form objects
# gem 'phony_rails', :git => 'git://github.com/joost/phony_rails.git'
gem 'active_attr'
gem 'validates'
gem 'hashie'
# берется последняя версия для совместимости с rails 4
gem 'state_machine', :git => 'git://github.com/pluginaweek/state_machine.git'
gem 'simple_enum'
# gem 'enumerize'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'


# Авторизация
# gem 'switch_user'

# Почта
gem 'recipient_interceptor'

gem 'mini_magick'
gem 'carrierwave'

# Контроллеры
#gem 'has_scope'
gem 'inherited_resources'

# Используется для сидирования обьектов
#gem 'forgery'
#gem 'ffaker'

#gem 'holidays'

# Вьюхи и презентеры
gem 'active_link_to'

gem 'draper'
gem 'breadcrumbs_on_rails'
#gem 'tabulous'
# gem 'authbuttons-rails'

gem 'simple-navigation', :git => 'git://github.com/andi/simple-navigation.git'
gem 'simple-navigation-bootstrap'

gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'

#gem 'nested_form'
#gem 'cocoon'

gem 'kaminari'
gem 'kaminari-bootstrap', '~> 3.0.1'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem "jquery-fileupload-rails"

#gem 'nilify_blanks', :git => 'git://github.com/rubiety/nilify_blanks.git'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'haml-rails'

gem 'bootstrap-sass', '>= 3.4.1'
gem 'compass-rails'
gem 'non-stupid-digest-assets'

gem 'devise'

#assets
# Use edge version of sprockets-rails
gem 'sprockets-rails'

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'acts-as-taggable-on'

gem 'mini_racer'

# Хорошая альтернатива jquery-ui-rails
#  gem 'jquery-ui-sass-rails'
# gem 'jquery_datepicker'

# gem 'select2-rails'
gem 'bootstrap-datepicker-rails'
gem 'email_validator'
gem 'littlesms', git: 'git://github.com/BrandyMint/littlesms.git'
gem 'dynamic_sitemaps'
gem 'mobile-fu'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'rspec-console'

  gem "hpricot", ">= 0.8.6"
  gem "ruby_parser", ">= 2.3.1"

  gem "better_errors"
  gem "binding_of_caller"

  gem 'rb-fsevent', '~> 0.9.1', require: false
  # Пока не нужны
  #gem 'ruby-graphviz'
  gem "mailcatcher", :require => false
  gem 'foreman'
end

group :development, :test do
  gem 'rb-inotify', '~> 0.9', :require => false
  gem "rspec-rails", ">= 2.11.0"
  gem 'pry'
  gem 'pry-byebug'
end

group :test do
  gem 'factory_bot'
  gem 'factory_bot_rails', github: 'thoughtbot/factory_bot_rails'
  gem 'rspec-prof'
  gem 'rspec-its'
  # Start Pry in the context of a failed test
  #gem 'plymouth'
  gem "fakeredis", :require => "fakeredis/rspec"
  gem 'resque_spec'
  gem "email_spec", ">= 1.2.1"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  #gem 'guard'
  ##gem 'debugger' unless `whoami`=~/jenkins/
  #gem 'guard-spork'
  #gem 'guard-rspec'
  #gem 'guard-rails'
  #gem 'guard-bundler'
  #gem 'guard-cucumber'
  #gem 'guard-ctags-bundler'

  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false

  gem "database_cleaner"
  gem "capybara"
  gem 'capybara-screenshot'
  gem 'poltergeist'

  gem "launchy", ">= 2.1.2"
  gem 'turn', :require => false
  #gem "test_active_admin", :git => "git://github.com/BrandyMint/test_active_admin.git"
end

group :deploy do
  gem 'bugsnag-capistrano', require: false
  gem 'capistrano', :require => false
  gem 'capistrano-rbenv', :require => false
  gem 'capistrano-rails', :require => false
  gem 'capistrano-git-with-submodules', '~> 2.0'
  gem 'capistrano-nvm', require: false
  gem 'capistrano-yarn', require: false
  gem 'capistrano-bundler',  :require => false
  gem 'capistrano3-puma', github: 'seuros/capistrano-puma', require: false
  gem 'capistrano-db-tasks', require: false
  gem 'capistrano-shell', require: false
end

gem "bugsnag", "~> 6.11"
