Rails.application.routes.draw do
  
  devise_for :users
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

  resources :user
  
  root "items#index"
  
  resources :cards, only: %i[index new create destroy show]

  resources :purchases, only: %i[new create]

  get "users/logout", to: "users#logout"
end
