class CreateTeamworkProjects < ActiveRecord::Migration
  def change
    create_table :teamwork_projects do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :status, null: false, default: 0
      t.timestamps null: false
    end
    add_index :teamwork_projects, :name
  end
end
