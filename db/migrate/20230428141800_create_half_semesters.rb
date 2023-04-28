class CreateHalfSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :half_semesters do |t|
      t.references :semester, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :type, null: false

      t.timestamps
    end
    add_index :half_semesters, :start_date
    add_index :half_semesters, :end_date
    add_index :half_semesters, :type
  end
end
