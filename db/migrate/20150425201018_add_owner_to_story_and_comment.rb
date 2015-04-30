class AddOwnerToStoryAndComment < ActiveRecord::Migration
  def change
    add_reference :teamwork_stories, :user
    add_reference :teamwork_comments, :user

    add_index :teamwork_stories, :user_id
    add_index :teamwork_comments, :user_id
  end
end
