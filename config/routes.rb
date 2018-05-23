Rails.application.routes.draw do
  get 'signin' => 'signin#signin', :as => :signin_signin
  get 'welcome/index'
  root 'welcome#index'
  scope(path_names: {create: 'register'}) do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
