class CreateTeamworkComments < ActiveRecord::Migration
  def change
    create_table :teamwork_comments do |t|
      t.text :content, null: false
      t.timestamps null: false
    end
  end
end
