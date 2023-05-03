class ChangeRequiredTables < ActiveRecord::Migration[7.0]
  def change
    rename_table :require_admission_years, :admission_years
    rename_table :required_courses, :course_categories
    rename_table :required_subject_categories, :subject_categories
    rename_table :required_subjects, :subject_groups
  end
end
