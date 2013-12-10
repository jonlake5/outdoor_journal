class CreateAdventureCoordinates < ActiveRecord::Migration
  def change
    create_table :adventure_coordinates do |t|
      t.integer :adventure_id
      t.datetime :date_time
      t.float :lat
      t.float :lon
      t.integer :elevation

      t.timestamps
    end
  end
end
