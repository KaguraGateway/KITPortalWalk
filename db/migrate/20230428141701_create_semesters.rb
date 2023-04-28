class CreateSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :semesters do |t|
      t.integer :year, null: false
      t.integer :gakki, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
    add_index :semesters, :year
    add_index :semesters, :gakki
    add_index :semesters, :start_date
    add_index :semesters, :end_date
  end
end
