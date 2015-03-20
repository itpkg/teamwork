class AddTeamworkActiveColumns < ActiveRecord::Migration
  def change
    add_column :teamwork_projects, :active, :boolean, default: true
    add_column :teamwork_stories,  :active, :boolean, default: true
    add_column :teamwork_comments, :active, :boolean, default: true
  end
end
