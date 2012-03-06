Hungrypotamus::Application.routes.draw do

  resources :games, :only => [:show]
  resources :chat_events, :only => [:create]
  resources :bites, :only => [:create]
  resources :gloats, :only => [:create]
  resources :press_mentions, :only => [:index]

  root :to => 'games#index'

end
