Trpn::Application.routes.draw do
  
	get "splash/index"
	root :to => 'splash#index'
  
	resources :users
  resources :rides
	resources :subscriptions, :only => [:create]

end
