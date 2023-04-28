class CreateClassSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :class_schedules do |t|
      t.string :name, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false

      t.timestamps
    end
    add_index :class_schedules, :name
    add_index :class_schedules, :start_time
    add_index :class_schedules, :end_time
  end
end
