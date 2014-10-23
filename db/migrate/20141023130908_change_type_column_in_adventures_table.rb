class ChangeTypeColumnInAdventuresTable < ActiveRecord::Migration
  def change
    rename_column :adventures, :type, :adventure_type
  end
end
