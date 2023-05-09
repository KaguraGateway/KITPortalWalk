class ChangeColumnScheduleIdToUserSubjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_subjects, :schedule_id, :bigint
    add_reference :user_subjects, :class_schedule, null: false
  end
end
