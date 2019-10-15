Rails.application.routes.draw do
  
  devise_for :users

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
  resources :users
  root "items#index"
  
end
