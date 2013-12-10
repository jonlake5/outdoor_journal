class AdventureAsset < ActiveRecord::Base
  belongs_to :adventure
  has_many :adventure_asset_types
end
