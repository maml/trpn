Trpn::Application.routes.draw do
  
	get "splash/index"
	root :to => 'splash#index'
  
	resources :users, :defaults => { :format => 'json' } do
  	resources :rides
	end
	
	resources :subscriptions, :only => [:create]

end
