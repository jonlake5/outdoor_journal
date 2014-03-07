class Adventure < ActiveRecord::Base
belongs_to :user
has_one :adventure_type
has_many :adventure_coordinates
has_many :adventure_comments
has_many :adventure_assets
has_one :weather

end
