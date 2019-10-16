Rails.application.routes.draw do
  devise_for :users
  resources :user do
    member do
      get 'identification'
    end
  end

  root "items#index"
  
  get "confirm", to: "items#confirm"
  post "confirm", to: "items#payment"
  resources :cards, only: %i[index new create destroy show]

  resources :purchases, only: %i[new create]

  get "users/logout", to: "users#logout"
end