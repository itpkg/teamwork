class CreateTeamworkProjects < ActiveRecord::Migration
  def change
    create_table :teamwork_projects do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :uid, null: false, limit: 36
      t.integer :status, null: false, default: 0
      t.timestamps null: false
    end
    add_index :teamwork_projects, :name
    add_index :teamwork_projects, :uid, unique: true
  end
end
