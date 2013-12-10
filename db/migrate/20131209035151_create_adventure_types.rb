class CreateAdventureTypes < ActiveRecord::Migration
  def change
    create_table :adventure_types do |t|
      t.string :adventure_type
      t.string :string

      t.timestamps
    end
  end
end
