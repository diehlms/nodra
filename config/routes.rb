Rails.application.routes.draw do
  get '/contacts', to: 'static_pages#contacts'
  get '/event', to: 'static_pages#event'
  get '/gallery', to: 'static_pages#gallery'
  get '/history', to: 'static_pages#history'
  get '/join', to: 'static_pages#join'
  get '/sale', to: 'static_pages#sale'
  get '/specs', to: 'static_pages#specs'
  root 'static_pages#home'
end
