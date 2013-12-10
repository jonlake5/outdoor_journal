class CreateAdventureAssetTypes < ActiveRecord::Migration
  def change
    create_table :adventure_asset_types do |t|
      t.string :adventure_asset_type

      t.timestamps
    end
  end
end
