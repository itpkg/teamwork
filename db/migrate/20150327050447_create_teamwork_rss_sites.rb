class CreateTeamworkRssSites < ActiveRecord::Migration
  def change
    create_table :teamwork_rss_sites do |t|
      t.integer :project_id, null: false
      t.string :url, null: false
      t.string :title, null: false, default: ' '
      t.timestamps null: false
    end
    add_index :teamwork_rss_sites, :url
    add_index :teamwork_rss_sites, :title
    add_index :teamwork_rss_sites, [:project_id, :url], unique: true
  end
end
