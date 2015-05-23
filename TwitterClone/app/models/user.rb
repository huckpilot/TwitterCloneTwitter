class User < ActiveRecord::Base
  has_secure_password
  has_many :users, :through => :relationships
  has_many :tweets
end
