class ChangeColumnRequired < ActiveRecord::Migration[7.0]
  def change
    remove_column :course_categories, :required_admissin_year_id, :bigint
    rename_column :course_categories, :required_admission_year_id, :admission_year_id
    rename_column :subject_categories, :required_course_id, :course_category_id
    rename_column :subject_groups, :required_subject_category_id, :subject_category_id
    rename_column :user_subjects, :required_subject_id, :subject_group_id
  end
end
