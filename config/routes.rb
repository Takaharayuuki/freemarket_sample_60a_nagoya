Rails.application.routes.draw do
  devise_for :users
  resources :user do
    member do
      get 'identification'
    end
  end

  root "items#index"
  resources :cards, only: %i[index new]
  get "purchase", to: "items#purchase"
  get "users/logout", to: "users#logout"
end
