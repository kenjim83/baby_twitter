class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.belongs_to :user
      t.belongs_to :follow_user, :class_name => "User"
    end
  end
end
