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
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
