class CreateTeamworkDocuments < ActiveRecord::Migration
  def change
    create_table :teamwork_documents do |t|
      t.integer :attachment_id, null: false
      t.integer :flag, null: false, default: 0
    end
    create_table :teamwork_documents_tags, id: false do |t|
      t.belongs_to :story_id, index: true
      t.belongs_to :tag_id, index: true
    end
  end
end
