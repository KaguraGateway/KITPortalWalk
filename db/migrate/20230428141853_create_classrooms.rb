class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.string :name, null: false
      t.references :building, null: false, foregin_key: true

      t.timestamps
    end
    add_index :classrooms, :name
  end
end
