Rails.application.routes.draw do
  devise_for :admins
  
  root            'static_pages#home'
  get 'help'  =>  'static_pages#help'
  get 'about' =>  'static_pages#about'
  resources :articles
  resources :contacts
end
