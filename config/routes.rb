Rails.application.routes.draw do
  get 'welcome/login', :as => :welcome_login

  get '/login', :to => 'sessions#new', :as => 'login'
  match 'auth/:provider/callback', :to => 'sessions#create', :via => [:get, :post]
  match 'auth/failure', :to => 'sessions#failure', :via => [:get, :post]
  get 'sessions/destroy', :as => 'logout'
  get 'search' => 'homepage#search'
  get 'results/food' => 'search#food'
  get 'results/restaurant' => 'search#restaurant'
  root 'homepage#home'
end
