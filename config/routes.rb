Rails.application.routes.draw do
  devise_for :users
  resources :user do
    member do
      get 'identification'
    end
  end

  root "items#index"
  resources :cards

  get "users/logout", to: "users#logout"
end
