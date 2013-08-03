Trpn::Application.routes.draw do

	devise_for :users
  
	resources :users, :only => [:index, :show] do
  	resources :rides, :controller => "users/rides"
	end

	resources :rides

	# TODO - remove this feature
	resources :subscriptions, :only => [:create]

	root :to => "rides#index"
end
