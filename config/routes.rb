Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :profiles, except: %i[ index ]
  resources :listings
  delete '/listings/(:id)', to: 'listings#destroy', as: 'delete_listing'
end
