Rails.application.routes.draw do
  devise_for :users
  root 'sets#index'
  resources :lists
  resources :items, only: [:new, :create, :destroy, :edit, :update]
end