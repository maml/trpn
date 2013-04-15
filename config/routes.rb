Trpn::Application.routes.draw do
  
	get "splash/index"
	root :to => "splash#index"
  
	resources :users do
  	resources :rides, :controller => 'users/rides'
	end

	resources :rides

	get "rides", controller: "rides", action: "all"

	resources :subscriptions, :only => [:create]

end
