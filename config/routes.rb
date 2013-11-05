YellowRed::Application.routes.draw do

  root :to => 'static_pages#home'
  get 'lobby', :to => 'static_pages#lobby' #login, site blurb
  get 'signup', :to => 'users#new'
  
  resource :profile, :only => [:show, :edit, :update]
  
  resource :session, :only => [:create, :destroy]  
  resources :users, :only => [:create] do 
    resource :saved_search, :only => [:show, :update]
  end
  
  resources :messages, :only => [:index, :show, :new, :create, :destroy]
  
  resources :maybes, :only => [:create, :destroy]
  get 'my-maybe-list', :to => 'maybes#index'
  
  resources :nopes, :only => [:create, :destroy]
  get 'my-nope-list', :to => 'nopes#index'
  
  resources :stars, :only => [:create, :destroy]
  get 'who-i-starred', :to => 'stars#index'
  get 'who-starred-me', :to => 'stars#starred_me'
  
  get ':username', :to => 'profiles#show'

end
