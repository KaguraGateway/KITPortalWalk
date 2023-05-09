class AddUniqClassroom < ActiveRecord::Migration[7.0]
  def change
    add_index :classrooms, [:room_number, :building_id], unique: true
  end
end
