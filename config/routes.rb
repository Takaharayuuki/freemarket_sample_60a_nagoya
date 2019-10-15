Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :user do
    member do
      get 'identification'
    end
  end

  root "items#index"
  resources :cards, only: %i[index new]
  resources :purchases, only: %i[new]

  get "users/logout", to: "users#logout"
end