YellowRed::Application.routes.draw do

  root :to => 'static_pages#home'
  get 'lobby', :to => 'sessions#lobby'
  get 'signup', :to => 'users#new'
  
  resource :session, :only => [:create, :destroy]
  
  resources :users, :only => [:create]
  resource :profile, :only => [:show, :edit, :update]
  resource :saved_search, :only => [:show, :update]
  
  resources :messages, :only => [:index, :show, :create, :destroy]
  
  resources :maybes, :only => [:index, :create, :destroy]
  get 'my-maybe-list', :to => 'maybes#index'
  
  resources :nopes, :only => [:index, :create, :destroy]
  get 'my-nope-list', :to => 'nopes#index'
  
  resources :stars, :only => [:index, :create, :destroy]
  get 'who-i-starred', :to => 'stars#index'
  get 'who-starred-me', :to => 'stars#starred_me'
  
  resources :profiles, :only => [:index]
  get ':username', :to => 'profiles#show'

end
