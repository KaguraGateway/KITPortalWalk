class CreateRequiredSubjects < ActiveRecord::Migration[7.0]
  def change
    create_table :required_subjects do |t|
      t.string :title, null: false
      t.integer :min_credit, null: false
      t.references :required_subject_category, null: false, foregin_key: true

      t.timestamps
    end
    add_index :required_subjects, :title, unique: true
    add_index :required_subjects, :min_credit
  end
end
