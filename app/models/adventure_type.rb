class AdventureType < ActiveRecord::Base
  has_many :adventures
  belongs_to :user
end
