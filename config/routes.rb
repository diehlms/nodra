Rails.application.routes.draw do
  get 'password_resets/new'
  root 'events#index'
  
  resources :users do
    member do
      get :confirm_email
    end
  end

  resource :sessions, only: [:new, :create, :destroy]
  resources :articles
  resources :comments, only: [:new, :create, :destroy]
  resources :contacts
  resources :events
  resources :pictures
  resources :users, except: [:new]
  resources :password_resets

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get '/contacts', to: 'contacts#index'
  get '/event', to: 'static_pages#event'
  get '/pictures', to: 'pictures#index'
  get '/history', to: 'static_pages#history'
  get '/join', to: 'static_pages#join'
  get '/sale', to: 'static_pages#sale'
  get '/specs', to: 'static_pages#specs'
  get '/blog', to: 'articles#index'
  get '/post', to: 'articles#new'
  get '/events', to: 'events#index'
  get '/mastspar', to: 'static_pages#mastspar'
  get '/gadfly', to: 'static_pages#gadfly'
end
