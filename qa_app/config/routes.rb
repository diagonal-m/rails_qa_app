Rails.application.routes.draw do
  resources :users
  root to: 'questions#index'
  resources :questions
end
