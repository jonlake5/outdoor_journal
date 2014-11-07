class CreateAdventureTags < ActiveRecord::Migration
  def change
    create_table :adventure_tags do |t|
      t.integer :adventure_id
      t.integer :user_defined_adventure_tag_id

      t.timestamps
    end
  end
end
