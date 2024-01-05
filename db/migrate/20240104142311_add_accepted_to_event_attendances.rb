class AddAcceptedToEventAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :event_attendances, :accepted, :integer, default: 0, null: false
  end
end
