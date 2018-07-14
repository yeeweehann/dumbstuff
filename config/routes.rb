Rails.application.routes.draw do
  
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root 'welcome#index'

    resources :sessions
    resources :users do
	      resources :todos
    end
    resources :admin

  	get "/sign_in" => "sessions#new", as: "sign_in"
	  get "/users/new" => "users#new", as: "sign_up"
  	delete "/sign_out" => "sessions#destroy", as: "sign_out"
  	post "/sessions/new" => "sessions#create" 
    delete "/admin/:admin_id/user/:user_id" => "admin#destroy", as: "kill_user"
  	get 'braintree/new'
    post 'braintree/checkout'

end
