Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:edit, :new, :show]
  resources :orders, only: [:index]
end

