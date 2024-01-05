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
require "test_helper"

class EventAttendanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
