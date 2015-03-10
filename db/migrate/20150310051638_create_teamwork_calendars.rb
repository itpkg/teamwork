class CreateTeamworkCalendars < ActiveRecord::Migration
  def change
    create_table :teamwork_calendars do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :address, null: false
      t.string :config, null: false, limit: 500
      t.timestamps null: false
    end
    add_index :teamwork_calendars, :title
  end
end
