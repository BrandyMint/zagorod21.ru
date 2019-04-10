Zagorod::Application.routes.draw do
  self.default_url_options Settings.app.default_url_options.symbolize_keys

  is_database_exists = begin
                         Page.table_exists?
                       rescue PG::ConnectionBad
                         false
                       end

  if is_database_exists
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end

  root 'welcome#index'
  get 'welcome/houses_rows'
  get "sitemap.xml", to: "welcome#sitemap", format: :xml, as: :sitemap

  resources :houses
  resources :orders
  resources :resorts, only: [:index, :show]

  namespace :api do
    post 'orders/estimate'
  end

  get "/:slug" => "pages#index"
  post "/:slug" => "pages#create"

  if is_database_exists
    Page.find_each do |page|
      resources page.slug, controller: :pages, only: [:index, :create]
    end
  end
end
