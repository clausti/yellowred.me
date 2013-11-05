YellowRed::Application.routes.draw do

  root :to => 'static_pages#home'
  get 'lobby', :to => 'static_pages#lobby' #login, site blurb
  get 'signup', :to => 'users#new'
  
  resource :profile, :only => [:show, :edit, :update]
  get 'profiles/:username', :to => 'profiles#show' #can this just be :username?
  
  resource :session, :only => [:create, :destroy]  
  resources :users, :only => [:create] do 
    resource :saved_search, :only => [:show, :update]
  end

end
