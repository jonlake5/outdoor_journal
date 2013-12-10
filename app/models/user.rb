class User < ActiveRecord::Base
  has_many :adventures, dependent: :destroy

end
