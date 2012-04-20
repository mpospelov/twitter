class Relationship < ActiveRecord::Base
  attr_accessible :followed_id
  belongs_to :user
end
