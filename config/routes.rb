Rails.application.routes.draw do
  
  devise_for :users

  resources :registrations, only: [:new, :edit, :update] do
    collection do
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
      post :create1
      post :create2
      post :create3
      post :create4
      post :create5
    end
  end

  resources :user
  resources :users
  root "items#index"
  
end
