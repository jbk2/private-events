require 'byebug'

class EventAttendancesController < ApplicationController

  def update
    @event_attendance = EventAttendance.find(params[:id])
    if params[:event_attendance][:accepted] == @event_attendance.accepted
      redirect_to events_path, status: :unprocessable_entity, notice: "Already #{@event_attendance.accepted}"
    elsif @event_attendance.update(event_attendance_params)
      redirect_to events_path, notice: "Successfully updated attendance"
    else
      render events_path, status: :unprocessable_entity, notice: "Failed to update attendance"
    end
  end

  private

  def event_attendance_params
    params.require(:event_attendance).permit(:accepted)
  end

end
