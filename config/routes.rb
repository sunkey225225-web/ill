Rails.application.routes.draw do
  get "pages/home"
  resources :users, only: [:show]

  

  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  
end

Rails.application.routes.draw do
  root "pages#home"
  resources :tweets
  devise_for :users
end