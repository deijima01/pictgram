Rails.application.routes.draw do
  root 'pages#index'
  get 'users/new'
  get 'pages/help'
  resources :users
end
