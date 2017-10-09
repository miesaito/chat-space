Rails.application.routes.draw do
  root  'messages#index'
  patch 'users/:id' => 'users#update'
  get   'users/:id/edit' => 'users#edit'

end
