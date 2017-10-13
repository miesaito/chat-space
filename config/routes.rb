Rails.application.routes.draw do
  devise_for :users
  root  'groups#index'
  resources :messages
  resources :users, only: %i(edit update)
  resources :groups, only: %i(show new create edit update)
end
