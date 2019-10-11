Rails.application.routes.draw do
  
  devise_for :users
  resources :user
  root "items#index"
  
end
