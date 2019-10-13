Rails.application.routes.draw do
  devise_for :users
  resources :user do
    member do
      get 'identification'
    end
  end

  root "items#index"
  get "confirm", to: "items#confirm"
  resources :cards, only: %i[index new create destroy]

  get "users/logout", to: "users#logout"
end
