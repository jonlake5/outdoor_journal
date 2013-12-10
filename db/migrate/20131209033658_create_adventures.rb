class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.integer :userId
      t.string :name
      t.text :comments
      t.integer :type
      t.string :closestCityStart
      t.string :closestCityEnd

      t.timestamps
    end
  end
end
