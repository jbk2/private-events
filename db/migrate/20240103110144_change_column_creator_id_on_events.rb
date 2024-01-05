class ChangeColumnCreatorIdOnEvents < ActiveRecord::Migration[7.0]
  def change
    reversible do |direction|
      direction.up   { change_column_null :events, :creator_id, false }
      direction.down { change_column_null :events, :creator_id, true }
    end
  end
end
