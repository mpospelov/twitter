class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship",:dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  validates :password, :presence => true
  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }, :format => { :with => email_regex }
  validates :name, :presence => true
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
end
