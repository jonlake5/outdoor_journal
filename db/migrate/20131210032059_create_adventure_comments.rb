class CreateAdventureComments < ActiveRecord::Migration
  def change
    create_table :adventure_comments do |t|
      t.integer :adventure_id
      t.text :comment
      t.float :comment_lat
      t.float :comment_lon
      t.integer :comment_elevation

      t.timestamps
    end
  end
end
