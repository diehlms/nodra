Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/contacts'
  get 'static_pages/event'
  get 'static_pages/gallery'
  get 'static_pages/history'
  get 'static_pages/join'
  get 'static_pages/sale'
  get 'static_pages/specs'
end
