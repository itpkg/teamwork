class CreateTeamworkXlsTables < ActiveRecord::Migration
  def change
    create_table :teamwork_xls_tables do |t|
      t.string :name, null:false
      t.integer :file_id, null:false
      t.timestamps null: false
    end
  end
end
