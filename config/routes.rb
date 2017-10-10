Rails.application.routes.draw do
  devise_for :users
  root  'messages#index'
  resources :messages
  resources :users, only: %i(edit update)
  resources :groups, only: %i(show new create edit)
end
