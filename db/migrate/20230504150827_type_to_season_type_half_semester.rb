class TypeToSeasonTypeHalfSemester < ActiveRecord::Migration[7.0]
  def change
    rename_column :half_semesters, :type, :season_type
  end
end
