Rails.application.routes.draw do
  root           'static_pages#home'
  get 'help'  => 'static_pages#help'
  get 'about' => 'static_pages#about'
  resources :admins, only: [:index, :update, :destroy]
  resources :articles
  resources :contacts

  # See https://goo.gl/xamqba, to avoid the route conflicts.
  devise_for :admins, path: 'devise'

  get 'material_orders/index'
  get 'new_material_order' => 'material_orders#new'
end
