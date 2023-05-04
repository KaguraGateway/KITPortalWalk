class AddSubjectCategoryToCourseCategory < ActiveRecord::Migration[7.0]
  def change
    remove_column :subject_categories, :course_category_id, :bigint
    add_reference :subject_categories, :course_category, null: false
  end
end
