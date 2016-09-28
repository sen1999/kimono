Rails.application.routes.draw do
  devise_for :users
  root to: 'coodinate#index'
  resources :tansu
  resources :list
end
