class Adventure < ActiveRecord::Base
  belongs_to :user
  belongs_to :adventure_type
  has_many :adventure_coordinates, :dependent => :delete_all
  has_many :adventure_comments, :dependent => :delete_all
  has_many :adventure_assets, :dependent => :delete_all
  has_many :weathers, :dependent => :delete_all
  attr_accessor :new_adventure_type
  before_save :create_adventure_type_from_name
  has_many :adventure_tags
  has_many :user_defined_adventure_tags, through: :adventure_tags


  def create_adventure_type_from_name
   create_adventure_type(:adventure_type => new_adventure_type, :user_id=> user_id ) unless new_adventure_type.blank?


  end

end
