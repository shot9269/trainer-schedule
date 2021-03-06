Rails.application.routes.draw do
  get 'plan_details/new'
  get 'plan_details/create'
  devise_for :trainers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trainers, only: [:show,:index]
  root to: "trainers#show"
  resources :clients do
    member do
      get :session_update
    end
    resources :plans, only: [:new, :create,:index,:destroy,:edit,:update] do
      resources :plan_details, only: [:new,:create,:show,:edit,:update]
    end
  end
end
