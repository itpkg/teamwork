class CreateTeamworkTags < ActiveRecord::Migration
  def change
    create_table :teamwork_tags do |t|
      t.integer :project_id, null: false
      t.string :name, null: false
      t.timestamps null: false
    end
    add_index :teamwork_tags, :name
  end

end
