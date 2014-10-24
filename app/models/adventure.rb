class Adventure < ActiveRecord::Base
  belongs_to :user
  belongs_to :adventure_type
  has_many :adventure_coordinates, :dependent => :delete_all
  has_many :adventure_comments, :dependent => :delete_all
  has_many :adventure_assets, :dependent => :delete_all
  has_many :weathers, :dependent => :delete_all

end
