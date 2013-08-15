TacoManager::Application.routes.draw do
  root to: 'profile#show'
  resources :users

  match 'auth/:provider/callback' => 'sessions#create', via: [:get, :post]
  match 'signin' => 'sessions#new', via: [:get, :post], as: :signin
  get 'signup' => 'users#new', as: :signup
  get "signout" => "sessions#destroy", as: :signout
  get "auth/failure" => "sessions#failure"

  if Rails.env.test?
    post '/sessions/create' => 'sessions#create'
  end

  get 'working', :to => 'errors#working'
end
