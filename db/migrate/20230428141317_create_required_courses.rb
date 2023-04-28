class CreateRequiredCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :required_courses do |t|
      t.string :title, null: false

      t.timestamps
    end
    add_index :required_courses, :title, unique: true
  end
end
