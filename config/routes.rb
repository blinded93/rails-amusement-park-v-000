Rails.application.routes.draw do
  root 'users#index'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  # get 'login' => 'sessions#new'
  # post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :rides, only: [:create]
  resources :users, except: [:index]
  resources :attractions
end
