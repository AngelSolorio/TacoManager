TacoManager::Application.routes.draw do
  root to: 'home#index'

  match 'auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  match 'signin' => 'sessions#new', via: [:get, :post], as: :signin
  get 'signup' => 'users#new', as: :signup
  get "signout" => "sessions#destroy", as: :signout

  resources :users

  if Rails.env.test?
    post '/sessions/create' => 'sessions#create'
  end
end
