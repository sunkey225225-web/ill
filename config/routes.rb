Rails.application.routes.draw do
  devise_for :users
  get "pages/home"
  resources :users, only: [:show]

  

  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end



  root "pages#home"
end