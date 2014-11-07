class AdventureTag < ActiveRecord::Base
  belongs_to :adventure
  belongs_to :user_defined_adventure_tag
  attr_accessor :new_tag


end
