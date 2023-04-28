class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :date, null: false

      t.timestamps
    end
    add_index :events, :title
    add_index :events, :date
  end
end
