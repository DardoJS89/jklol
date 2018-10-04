Rails.application.routes.draw do
  devise_for :users
  
  root 'tasks#index'
  resources :tasks, only: [:create, :index, :destroy]
end
