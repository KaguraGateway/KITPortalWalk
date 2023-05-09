class ChangeNameColumnStrToIntClassRoom < ActiveRecord::Migration[7.0]
  def change
    change_column :classrooms, :name, :integer
  end
end
