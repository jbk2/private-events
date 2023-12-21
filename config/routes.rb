Rails.application.routes.draw do
  # get 'events/new'
  # get 'events/create'
  # get 'events/index'

  resources :events, :only => [:new, :create, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
