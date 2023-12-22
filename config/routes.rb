Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :events, :only => [:new, :create, :index]

  # Defines the root path route ("/")
  root "events#index"
end
