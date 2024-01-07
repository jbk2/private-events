require 'byebug'
class EventsController < ApplicationController
  before_action :authorize_creator, only: [:invite_users]
  
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      @event.invite_user(@event.creator.id)
      redirect_to event_path(@event.id), notice: "sucessfully saved record"
    else
      render new_event_path, status: :unprocessable_entity, notice: "failed to save record"
    end
  end

  def index
    @attending_events = current_user.attending_events
    @past_events = current_user.attending_events.select { |e| e.date.past? }
    @future_events = current_user.attending_events.select { |e| e.date.future? }
  end

  def show
    @event = Event.find(params[:id])
    @users = User.all
    @not_yet_invited_users = @users - @event.attendees
  end

  def invite_users
    @event = Event.find(params[:id])
    user_ids = Array(params[:event][:attendee_id]).reject(&:empty?)
    if @event.invite_users(user_ids)
      redirect_to event_path(@event), notice: 'Invitations sent successfully.'
    else
      render event_path(@event), status: :unprocessable_entity, notice: 'Failed to send invitations.'
    end
  end

  private
  def event_params
    params.require(:event).permit(:date, :location, :accepted, :id, :creator_id)
  end

  def authorize_creator
    @event = Event.find(params[:id])
    unless current_user == @event.creator
      redirect_to @event, notice: "you are not the event creator therefore are unauthorised to invite users"
    end
  end
end