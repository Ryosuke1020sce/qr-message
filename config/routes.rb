Rails.application.routes.draw do
  devise_for :users

  root to: 'messages#index'

  resources :messages, only: [:index, :new, :create, :show] do
    resources :letters, only: [:create]
    get 'display', to: 'messages#display'
  end

  resources :guests, only: [:show]
  
end
