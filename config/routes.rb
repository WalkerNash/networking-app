Rails.application.routes.draw do
  devise_for :users
  resources :two
  resources :three
  resources :four
  resources :five
  root to: "two#index"
  resources :relationships do
    resources :conversations do
      resources :messages
    end
    end
  end
