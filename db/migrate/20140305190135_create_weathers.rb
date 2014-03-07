class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.integer :adventure_id
      t.float :wind_speed
      t.integer :wind_dir
      t.float :temp
      t.string :conditions
      t.string :icon

      t.timestamps
    end
  end
end
