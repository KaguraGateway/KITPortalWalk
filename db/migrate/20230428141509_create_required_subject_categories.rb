class CreateRequiredSubjectCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :required_subject_categories do |t|
      t.string :title, null: false
      t.references :required_course, null: false, foreign_key: true

      t.timestamps
    end
    add_index :required_subject_categories, :title, unique: true
  end
end
