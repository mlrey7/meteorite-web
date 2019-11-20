Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'home/index'
  devise_for :users
  resources :users, only: [:show]
  resources :microposts, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
