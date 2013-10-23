Platform::Application.routes.draw do

  # Homepages
  authenticated do
  	root :to => 'places#index'
  end
  root :to => redirect("/sign_in")

  resources :places

  resources :users do
    member do
      get :show, :controller => "users/users"
    end
  end

  devise_for :users, 
		:controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions" }

	devise_scope :user do
		get 'sign_in', :to => 'devise/sessions#new', :as => :new_session
		get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	end

end

