Rails.application.routes.draw do
  devise_for :users
  resources :user

  root "items#index"
  resources :cards

  get "users/logout", to: "users#logout"
end
