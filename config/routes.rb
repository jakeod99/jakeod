Rails.application.routes.draw do
  root 'welcome#index'

  # uncomment to resume work on user sessions
  # get 'error/construction'
  # get '/signin', to: 'sessions#new'
  # post '/signin', to: 'sessions#create'
  # delete '/signout', to: 'sessions#destroy'
  # get '/register', to: 'users#new'
  # resources :users

  # delete when starting work on user sessions
  get '/signin', to: 'error#construction'
  get '/register', to: 'error#construction'
  get '/users', to: 'error#construction'

end
