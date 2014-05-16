class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :follow_user, :class_name => "User"
end




# Find user who follow you

# Follow.find_by_follow_user_id(2).user