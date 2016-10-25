Rails.application.routes.draw do
  devise_for :users
  root 'sets#index'
  resources :lists
  resources :items do
    collection do
      get :belt_new
      get :collar_new
      post :belt_create
      post :collar_create
    end
  end
end