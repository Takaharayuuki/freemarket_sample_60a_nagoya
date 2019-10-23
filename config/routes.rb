Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get :category_menu_children
    end
  end

  resources :user do
    member do
      get 'identification'
    end
  end

  resources :registrations, only: [:new, :edit, :update] do
    collection do
      get :new
      get :new1
      get :new2
      get :new3
      get :new4
      get :new5
      get :new6
      get :done
    end
    collection do
      post :create
    end
  end
  
  resources :cards, only: %i[index new create destroy show]

  resources :purchases, only: %i[new create]

  get "users/logout", to: "users#logout"
end
