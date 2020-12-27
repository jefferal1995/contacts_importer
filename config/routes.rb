Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :imports, only: [:show, :create, :index]
  resources :contacts, only: [:index]

  root to: 'pages#home'
end
