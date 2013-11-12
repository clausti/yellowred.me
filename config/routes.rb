YellowRed::Application.routes.draw do

  root :to => 'static_pages#home'
  get 'lobby', :to => 'sessions#lobby'
  get 'signup', :to => 'users#new'
  
  resource :session, :only => [:create, :destroy]
  
  resources :users, :only => [:create]
  resource :profile, :only => [:show, :edit, :update]
  
  resource :saved_search, :only => [:show, :update]
  get 'saved_search/results', :to => 'saved_searches#results'
  
  resources :messages, :only => [:index, :show, :create, :destroy]
  
  resources :maybes, :only => [:create, :update, :destroy]
  get 'my-maybe-list', :to => 'maybes#maybe_list'
  get 'my-nope-list', :to => 'maybes#nope_list'
  
  resources :stars, :only => [:index, :create]
  delete 'stars/:profile_id' => 'stars#destroy'
  get 'who-i-starred', :to => 'stars#index'
  get 'who-starred-me', :to => 'stars#starred_me'
  
  resources :profiles, :only => [:index, :show]
  get ':username', :to => 'profiles#show'

end
