class CreateRequiredAdmissionYears < ActiveRecord::Migration[7.0]
  def change
    create_table :required_admission_years do |t|
      t.integer :year
      t.string :external_text

      t.timestamps
    end
    add_index :required_admission_years, :year, unique: true
  end
end
