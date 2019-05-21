Rails.application.routes.draw do
  root 'static_pages#home'
  
  resources :users
  resource :sessions, only: [:new, :create, :destroy]
  resources :articles
  resources :comments
  resources :users, except: [:new]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get '/contacts', to: 'static_pages#contacts'
  get '/event', to: 'static_pages#event'
  get '/gallery', to: 'static_pages#gallery'
  get '/history', to: 'static_pages#history'
  get '/join', to: 'static_pages#join'
  get '/sale', to: 'static_pages#sale'
  get '/specs', to: 'static_pages#specs'
  get '/blog', to: 'articles#index'
  get '/post', to: 'articles#new'
end
