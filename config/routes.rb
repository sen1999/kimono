Rails.application.routes.draw do
  devise_for :users
  root 'coodinate#index'
  resources :list
  resources :tansu
end