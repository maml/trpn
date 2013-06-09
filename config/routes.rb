Trpn::Application.routes.draw do

	devise_for :users
  
	# get "splash/index"
  
	resources :users, :only => [:index, :show] do
  	resources :rides, :controller => 'users/rides'
	end

	resources :rides do
		resources :messages, :controller => 'rides/messages'
	end

	get "rides", controller: "rides", action: "all"

	resources :subscriptions, :only => [:create]

	root :to => "rides#index"
end
