Trpn::Application.routes.draw do

	get :signup, to: "users#new", 			 as: "signup"
	get :login,  to: "sessions#new", 		 as: "login"
	get :logout, to: "sessions#destroy", as: "logout"

	resources :users do
  	resources :rides, :controller => "users/rides"
	end

	resources :sessions

	resources :conversations, only: [:index, :show, :new, :create] do
		member do
			post :reply
			post :trash
			post :untrash
		end
	end

	resources :rides do
		member do
			get :message
			post :send_message
		end
	end

	# TODO - remove this feature
	resources :subscriptions, :only => [:create]
  
  resources :import, :only => [:index]

	root :to => "rides#index"
end
