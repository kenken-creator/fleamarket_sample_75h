Rails.application.routes.draw do
  devise_for :users

  get '/logout', to: 'sessions#logout_page'
  get '/card_page', to: 'card#card_page'
  get '/purchase_confirmation', to: 'items#purchase_confirmation'

  resources :users, only: [:new, :show]
  resources :card, only: [:new]
  resources :items, only: [:new, :show] do
    collection do
      get 'purchase_confirmation'
    end
  end

  root 'items#index'


end