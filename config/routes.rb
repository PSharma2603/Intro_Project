Rails.application.routes.draw do
  # Define RESTful routes for Products
  resources :products, only: [:index, :show]

  # Define RESTful routes for Orders
  resources :orders, only: [:index, :show]

  # Define RESTful routes for Vendors (if needed)
  resources :vendors, only: [:index, :show]

  # Define RESTful routes for Users (if needed)
  resources :users, only: [:index, :show]

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA service worker routes (if used)
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Set the root page (modify this to an actual homepage)
  root "products#index"  
end
