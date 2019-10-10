Rails.application.routes.draw do
  devise_for :users
  resources :users

  root "items#index"
  get "/credit1", to: "items#credit1"

end
