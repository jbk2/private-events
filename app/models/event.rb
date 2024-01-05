# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  date       :date
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :string           not null
#
class Event < ApplicationRecord
  
  
  # therefore rails makes @event.creator works
  belongs_to :creator, class_name: 'User'

  has_many :event_attendances, foreign_key: :attending_event_id
  has_many :attendees, through: :event_attendances, source: :event_attendee

end