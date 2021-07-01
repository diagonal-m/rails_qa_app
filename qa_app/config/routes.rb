Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  root to: 'questions#index'
  resources :questions do
    resources :answers, only: [:create]
  end
end
