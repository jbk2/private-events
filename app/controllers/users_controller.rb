class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  
  def show
    @users_events = current_user.events

  end
end
