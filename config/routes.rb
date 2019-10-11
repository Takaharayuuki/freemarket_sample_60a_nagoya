Rails.application.routes.draw do
  devise_for :users
  resources :users

  root "items#index"
  get "/payment", to: "items#payment"
  get "/input", to: "items#input"

end
