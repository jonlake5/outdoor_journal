class AddUserIdtoAdventureTypes < ActiveRecord::Migration
  def change
    add_column :adventure_types, :user_id, :integer
  end
end
