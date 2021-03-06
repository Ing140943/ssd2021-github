Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  get '/admin' => "admins/products#index", :as => :admin_root
  # root 'products#index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admins do
    resources :products
    namespace :products do
      post 'csv_upload'
    end
  end
end
