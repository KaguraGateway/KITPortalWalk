class DropBuildingsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :buildings
  end
end
