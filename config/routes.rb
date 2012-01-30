Hungrypotamus::Application.routes.draw do

  resources :games, :only => [:index]
  resources :bites, :only => [:create]
  resources :gloats, :only => [:create]

  root :to => 'games#index'

end
