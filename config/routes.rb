Rails.application.routes.draw do
  get 'messages/inbox'
  get 'conversations/index'
  root 'static_pages#home'
  get '/payments/success', to: 'payments#success', as: 'payment_success'
  post '/payments/webhook', to: 'payments#webhook'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :profiles, except: %i[ index ]
  get 'listings/filter', to: 'listings#filter', as: 'filter_listings'
  resources :listings
  delete '/listings/(:id)', to: 'listings#destroy', as: 'delete_listing'
  post '/watches', to: 'watches#create', as: 'create_watch'
  delete '/watches/(:id)', to: 'watches#destroy', as: 'delete_watch'
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  post '/conversations', to: 'conversations#create', as: 'create_conversation'
end
