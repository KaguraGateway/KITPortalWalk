class CreateUserSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :user_subjects do |t|
      t.references :user, null: false, foregin_key: true
      t.string :subject_name, null: false
      t.integer :grade
      t.integer :credits, null: false
      t.references :classroom, foregin_key: true
      t.integer :day, null: false
      t.references :schedule, null: false
      t.references :semester, null: false, foregin_key: true
      t.references :half_semester, foregin_key: true
      t.references :required_subject, null: false, foregin_key: true

      t.timestamps
    end
    add_index :user_subjects, :subject_name
    add_index :user_subjects, :grade
    add_index :user_subjects, :day
  end
end
