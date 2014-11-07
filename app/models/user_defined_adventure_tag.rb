class UserDefinedAdventureTag < ActiveRecord::Base
  belongs_to :user
  has_many :adventure_tags
  has_many :adventures, through: :adventure_tags
end
