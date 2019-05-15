Rails.application.routes.draw do
  root 'static_pages#home'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/contacts', to: 'static_pages#contacts'
  get '/event', to: 'static_pages#event'
  get '/gallery', to: 'static_pages#gallery'
  get '/history', to: 'static_pages#history'
  get '/join', to: 'static_pages#join'
  get '/sale', to: 'static_pages#sale'
  get '/specs', to: 'static_pages#specs'
end
