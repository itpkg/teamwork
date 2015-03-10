class CreateTeamworkDocuments < ActiveRecord::Migration
  def change
    create_table :teamwork_documents do |t|
      t.integer :project_id, null:false
      t.integer :attachment_id, null:false
      t.integer :flag, null:false, default:0
    end
  end
end
