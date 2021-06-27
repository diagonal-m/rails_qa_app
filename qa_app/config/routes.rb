Rails.application.routes.draw do
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get 'users/index'
  root to: 'questions#index'
  resources :questions
end
