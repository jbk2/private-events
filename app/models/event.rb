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
  belongs_to :creator, class_name: 'User'

  has_many :event_attendances, foreign_key: :attending_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :event_attendee

  scope :in_the_past, -> { where("date < ?", Date.current) }
  scope :in_the_future, -> { where("date > ?", Date.current) }

  
  # scope :in_the_past, -> { where(:date.past?) }

  # scope :users_future_events, ->(user_id) {
  #   all.select { |event| event.date.future? && event.creator_id == user_id }
  # }


  def invite_users(user_ids)
    user_ids.each do |user_id|
      user = User.find(user_id)
      event_attendances.create(event_attendee_id: user.id) unless attendees.include?(user)
    end
  end

  def invite_user(id)
    user = User.find(id)
    event_attendances.create(event_attendee_id: user.id) unless attendees.include?(user)
  end

end