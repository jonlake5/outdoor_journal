class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :f_name,  presence: true, length: { maximum: 50 }
  validates :l_name,  presence: true, length: { maximum: 50 }
  has_many :adventures, dependent: :destroy
  
end
