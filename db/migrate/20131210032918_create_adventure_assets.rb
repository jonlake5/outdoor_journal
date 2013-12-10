class CreateAdventureAssets < ActiveRecord::Migration
  def change
    create_table :adventure_assets do |t|
      t.integer :adventure_id
      t.text :comment
      t.integer :type
      t.binary :asset

      t.timestamps
    end
  end
end
