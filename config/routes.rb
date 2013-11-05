YellowRed::Application.routes.draw do

  root :to => 'static_pages#home'
  get 'lobby', :to => 'sessions#new'
  get 'sign-up', :to => 'users#new'
  
  resource :profile, :only => [:show, :edit, :update]
  
  resource :session, :only => [:create, :destroy]  
  resources :users, :only => [:create] do 
    resource :saved_search, :only => [:show, :update]
  end
  
  resources :messages, :only => [:index, :show, :create, :destroy]
  
  resources :maybes, :only => [:index, :create, :destroy]
  
  resources :nopes, :only => [:index, :create, :destroy]
  
  resources :stars, :only => [:index, :create, :destroy]
  get 'who-starred-me', :to => 'stars#starred_me'
  
  get ':username', :to => 'profiles#show'

end
