class AddAdventureIdtoAdventureTypeTable < ActiveRecord::Migration
  def change
    add_column :adventure_types, :adventure_id, :integer
    remove_column :adventure_types, :string
  end
end
