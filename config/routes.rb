Rails.application.routes.draw do
  get 'signin' => 'signin#signin', :as => :signin_signin
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
