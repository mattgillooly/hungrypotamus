Hungrypotamus::Application.routes.draw do

  resources :games, :only => [:index, :show]
  resources :bites, :only => [:create]
  resources :gloats, :only => [:create]
  resources :press_mentions, :only => [:index]

  root :to => 'games#index'

end
