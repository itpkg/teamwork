class CreateTeamworkStories < ActiveRecord::Migration
  def change
    create_table :teamwork_stories do |t|
      t.integer :project_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :point, null: false
      t.integer :flag, null: false, default: 0
      t.integer :progress, null: false, default: 0
      t.integer :status, default: 0, null: false

      t.datetime :plan_start_time
      t.datetime :real_start_time
      t.datetime :plan_finish_time
      t.datetime :real_finish_time

      t.timestamps null: false
    end
    add_index :teamwork_stories, :name

    create_table :teamwork_stories_tags, id: false do |t|
      t.belongs_to :story_id, index: true
      t.belongs_to :tag_id, index: true
    end
  end
end
