Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/update'
  get 'messages/inbox'
  get 'conversations/index'
  root 'static_pages#home'
  get '/payments/success', to: 'payments#success', as: 'payment_success'
  post '/payments/webhook', to: 'payments#webhook'
  get 'listings/filter', to: 'listings#filter', as: 'filter_listings'
  get '/listings/(:id)/postage', to: 'listings#postage', as: 'postage'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :profiles, except: %i[ index ]
  resources :listings
  resources :reviews
  delete '/listings/(:id)', to: 'listings#destroy', as: 'delete_listing'
  post '/watches', to: 'watches#create', as: 'create_watch'
  get '/watchlist', to: 'watches#index', as: 'watchlist'
  delete '/watches/(:id)', to: 'watches#destroy', as: 'delete_watch'
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  post '/conversations', to: 'conversations#create', as: 'create_conversation'
end
