class ReCreateBuildingsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings, id: false do |t|
        t.column :id, "bigint PRIMARY KEY"
        t.integer :place_type
    end
  end
end
