class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :adventure_assets, :type, :adventure_asset_types_id
  end
end
