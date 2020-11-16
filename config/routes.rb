Rails.application.routes.draw do
  get 'plans/new'
  devise_for :trainers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trainers, only: [:show, :index]
  root to: "trainers#index"
  resources :clients, only: [:new, :create,:show]
  resources :plans, only: [:new, :create]
end
