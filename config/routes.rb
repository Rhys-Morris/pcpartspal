Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :profiles, except: %i[ index ]
  resources :listings
  delete '/listings/(:id)', to: 'listings#destroy', as: 'delete_listing'
  post '/watches', to: 'watches#create', as: 'create_watch'
  delete '/watches/(:id)', to: 'watches#destroy', as: 'delete_watch'
end
