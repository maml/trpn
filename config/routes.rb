Trpn::Application.routes.draw do

	devise_for :users
  
	resources :users, :only => [:index, :show] do
  	resources :rides, :controller => "users/rides"
	end

	resources :conversations, only: [:index, :show, :new, :create] do
		member do
			post :reply
			post :trash
			post :untrash
		end
	end

	resources :messages

	get "message", to: "conversations#index"

	resources :rides

	# TODO - remove this feature
	resources :subscriptions, :only => [:create]

	root :to => "rides#index"
end
