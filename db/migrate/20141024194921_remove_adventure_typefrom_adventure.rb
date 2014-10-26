class RemoveAdventureTypefromAdventure < ActiveRecord::Migration
  def change
    remove_column :adventures, :adventure_type
  end
end
