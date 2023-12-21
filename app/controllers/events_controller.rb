class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, notice: "sucessfully saved record"
    else
      render events_new_path, notice: "failed to save record"
    end
  end

  def index
    @events = Event.all
  end

  private
  def event_params
    params.require(:event).permit(:date, :location, :id)
  end

end