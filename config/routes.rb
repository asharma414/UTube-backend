Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :likes, only: [:create, :update, :destroy]
  resources :subscriptions, only: [:create, :destroy]
  resources :views, only: [:create]
  resources :genres
  resources :videos
  resources :users
  post '/login', to: 'auth#create'
  get  '/token', to: 'auth#token_log_in'
  get '/feed/subscriptions', to: "feed#subscriptions"
  get '/feed/liked', to: 'feed#liked'
  get '/feed/viewed', to: 'feed#viewed'
  get '/feed/:id', to: 'feed#channel'
  get '/likes/:id', to: 'likes#liked'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
