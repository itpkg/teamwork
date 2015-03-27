class CreateTeamworkRssItems < ActiveRecord::Migration
  def change
    create_table :teamwork_rss_items do |t|
      t.string :site_url, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.timestamp :created, null: false
    end

    add_index :teamwork_rss_items, :url
    add_index :teamwork_rss_items, :site_url
    add_index :teamwork_rss_items, :title
    add_index :teamwork_rss_items, [:site_url, :url], unique: true

    execute 'ALTER TABLE teamwork_rss_items ALTER COLUMN created SET DEFAULT now()'
  end
end
