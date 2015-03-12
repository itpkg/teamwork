class CreateTeamworkXlsFiles < ActiveRecord::Migration
  def change
    create_table :teamwork_xls_files do |t|
      t.string :name, null:false
      t.timestamps null: false
    end
  end
end
