class AddIsClassTimeToClassSchedule < ActiveRecord::Migration[7.0]
  def change
    add_column :class_schedules, :is_class_time, :boolean, default: true
  end
end
