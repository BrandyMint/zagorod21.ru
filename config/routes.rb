Zagorod::Application.routes.draw do

  self.default_url_options Settings.app.default_url_options.symbolize_keys

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'welcome#index'
  get 'welcome/houses_rows'

  resources :houses, only: [:index, :show]
  resources :resorts, only: [:index, :show]
  #resources :services, only: :index
  get 'services', to: redirect('/pages/services')
  resources :orders, only: [:create, :show]
  resources :order_requests, only: [:create, :new]

  namespace :api do
    post 'orders/estimate'
  end

  resources :orders, only: :create

  get 'pages/:slug' => 'pages#show', as: 'page'

  get 'feedback', to: 'welcome#feedback'
  get 'contact', to: 'welcome#contact'
  get 'search', to: 'welcome#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
