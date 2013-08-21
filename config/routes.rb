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
