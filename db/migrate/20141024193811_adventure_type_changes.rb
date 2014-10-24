class AdventureTypeChanges < ActiveRecord::Migration
  def change
    add_column  :adventures, :adventure_type_id, :integer 
    remove_column :adventure_types, :adventure_id
  end
end
