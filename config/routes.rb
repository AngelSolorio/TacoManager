TacoManager::Application.routes.draw do
  root to: 'home#index'
  resources :users

  get 'signin' => 'sessions#new'
  get 'auth/:provider/callback' => 'sessions#create'
  get "signout" => "sessions#destroy", as: :signout
  get '/auth/failure', to: redirect('/')

  if Rails.env.test?
    post '/sessions/create' => 'sessions#create'
  end
end
