class User < ActiveRecord::Base
  has_many :tweets
  has_many :follows
  has_many :follow_users, :through => :follows

  validates :password, presence: true
  validates :username, presence: true, uniqueness: true

end
