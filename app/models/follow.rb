class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
end
