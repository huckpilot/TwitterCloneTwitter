class User < ActiveRecord::Base
  has_many :users, :through => :relationships
  has_many :tweets
end
