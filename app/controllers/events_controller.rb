class EventsController < ApplicationController
  # before_action :authenticate_user! #, only: [:new, :create, :index, :show] 
  
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event.id), notice: "sucessfully saved record"
    else
      render new_event_path, status: :unprocessable_entity, notice: "failed to save record"
    end
  end

  def index
    @attending_events = current_user.attending_events
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
    @not_yet_invited_users = @users - @event.attendees
  end

  def invite_users
    @event = Event.find(params[:id])
    user_ids = Array(params[:event][:attendee]).reject(&:empty?)

    user_ids.each do |user_id|
      @user = User.find(user_id)
      unless @event.attendees.include?(@user)
        @event.attendees << @user
      end
    end

    redirect_to event_path(@event), notice: 'Invitations sent successfully.'
  end

  private
  def event_params
    params.require(:event).permit(:date, :location, :id, :creator_id)
  end

end