class User < ActiveRecord::Base
  has_many :tweets
  has_many :follows
  has_many :follow_users, :through => :follows

end
