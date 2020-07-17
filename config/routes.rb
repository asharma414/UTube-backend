Rails.application.routes.draw do
  resources :genres
  resources :videos
  resources :users
  post '/login', to: 'auth#create'
  get  '/token', to: 'auth#token_log_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
