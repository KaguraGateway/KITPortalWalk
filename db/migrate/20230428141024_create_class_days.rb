class CreateClassDays < ActiveRecord::Migration[7.0]
  def change
    create_table :class_days do |t|
      t.date :date, null: false
      t.integer :day, null: false

      t.timestamps
    end
    add_index :class_days, :date, unique: true
    add_index :class_days, :day
  end
end
