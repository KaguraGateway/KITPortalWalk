class ChangeNameToRoomNumberClassroom < ActiveRecord::Migration[7.0]
  def change
    rename_column :classrooms, :name, :room_number
  end
end
