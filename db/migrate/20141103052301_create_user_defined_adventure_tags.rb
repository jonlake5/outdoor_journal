class CreateUserDefinedAdventureTags < ActiveRecord::Migration
  def change
    create_table :user_defined_adventure_tags do |t|
      t.integer :user_id
      t.string :tag

      t.timestamps
    end
  end
end
