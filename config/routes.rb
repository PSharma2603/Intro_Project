Rails.application.routes.draw do
    get "categories/index"
    get "categories/show"
  # Root path (Homepage)
  root "products#index"  

  # Define RESTful routes for core resources
  resources :products, only: [:index, :show] do
    collection do
      get 'search' # Route for product search
    end
  end

  resources :orders, only: [:index, :show]
  resources :vendors, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :categories, only: [:index, :show]  # Added categories for Feature 3.4

  # Static Pages
  get "about", to: "pages#about"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA service worker routes (if used)
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
