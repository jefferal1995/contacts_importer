Rails.application.routes.draw do
  devise_for :users

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :imports, only: [:show, :create, :index]
  resources :contacts, only: [:index]

  root to: 'pages#home'
end
