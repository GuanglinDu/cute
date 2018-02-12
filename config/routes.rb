Rails.application.routes.draw do
  root 'static_pages#home'
  resources :articles

  get 'static_pages/help'
  get 'static_pages/about'
end
