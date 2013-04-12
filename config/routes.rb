Trpn::Application.routes.draw do
  
	get "splash/index"
	root :to => 'splash#index'
  
	resources :users do
  	resources :rides
	end

	get "rides/all"

	resources :subscriptions, :only => [:create]

end
