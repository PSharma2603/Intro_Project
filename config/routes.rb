Rails.application.routes.draw do
  get "vendors/index"
  get "vendors/show"
  get "orders/index"
  get "orders/show"
  get "pages/about"
  # Root path (Homepage)
  root "products#index"  

  # Define RESTful routes for core resources
  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :vendors, only: [:index, :show]
  resources :users, only: [:index, :show]

  # Static Pages
  get "about", to: "pages#about"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA service worker routes (if used)
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
