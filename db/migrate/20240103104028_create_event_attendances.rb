class CreateEventAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :event_attendances do |t|
      t.integer :event_attendee_id
      t.integer :attending_event_id

      t.timestamps
    end
  end
end
