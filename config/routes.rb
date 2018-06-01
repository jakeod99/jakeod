Rails.application.routes.draw do
  root 'welcome#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get '/register', to: 'users#new'
  resources :users
end
