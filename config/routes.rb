Trpn::Application.routes.draw do

	devise_for :users
  
	resources :users, :only => [:index, :show] do
  	resources :rides, :controller => "users/rides" do
			resources :messages, :controller => "users/rides/messages"
		end
	end

	resources :rides

	resources :subscriptions, :only => [:create]

	root :to => "rides#index"
end
