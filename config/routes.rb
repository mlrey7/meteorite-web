Rails.application.routes.draw do
  root to: 'welcome#index'
  get 'home/index'
  devise_for :users
  resources :microposts, only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
