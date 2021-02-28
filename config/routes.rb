Rails.application.routes.draw do
  resources :listings
  root 'static_pages#home'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :profiles, except: %i[ index ]
end
