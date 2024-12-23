Rails.application.routes.draw do
  devise_for :users

  root to: 'messages#index'

  resources :messages, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :letters, only: [:create, :edit, :update, :destroy]
    get 'display', to: 'messages#display'
    get 'destroy_confirm', to: 'messages#destroy_confirm'
  end

  resources :guests, only: [:show]
  
end
