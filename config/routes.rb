Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :services
  resources :users
  resources :charges
  root to: "services#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
