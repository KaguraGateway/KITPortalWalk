class AddRequiredAdmissionYearIdToRequiredCourse < ActiveRecord::Migration[7.0]
  def change
    add_reference :required_courses, :required_admission_year, null: false, foreign_key: true
  end
end
