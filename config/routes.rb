Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'events#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  resources :events, :only => [:new, :create, :index, :show, :update, :destroy] do
    member do
      post 'invite_users'
    end
  end
  
  get 'users/show'

  resources :event_attendances, only: [:update]
end