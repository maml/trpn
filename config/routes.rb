Trpn::Application.routes.draw do
  
	get "splash/index"
	root :to => 'splash#index'
  
	resources :users do
  	resources :rides
	end

	resources :subscriptions, :only => [:create]

end
