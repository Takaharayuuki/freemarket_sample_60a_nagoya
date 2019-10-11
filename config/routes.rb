Rails.application.routes.draw do
  devise_for :users
  resources :user

  root "items#index"
  get "/payment", to: "items#payment"
  get "/card_input", to: "items#card_input"

end
