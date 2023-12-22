class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create] 
  
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to events_path, notice: "sucessfully saved record"
    else
      render new_event_path, status: :unprocessable_entity, notice: "failed to save record"
    end
  end

  def index
    @events = Event.all
  end

  private
  def event_params
    params.require(:event).permit(:date, :location, :id, :user_id)
  end

end