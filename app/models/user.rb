class User < ActiveRecord::Base
  has_many :posts

  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  validates :password, :presence => true
  validates :email, :presence => true
  validates :name, :presence => true

end
