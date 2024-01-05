# == Schema Information
#
# Table name: event_attendances
#
#  id                 :bigint           not null, primary key
#  event_attendee_id  :integer
#  attending_event_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  accepted           :integer          default(0), not null
#
class EventAttendance < ApplicationRecord
  belongs_to :event_attendee, class_name: 'User', foreign_key: 'event_attendee_id'
  belongs_to :attending_event, class_name: 'Event', foreign_key: 'attending_event_id'
  
  enum accepted: { pending: 0, accepted: 1}
end
