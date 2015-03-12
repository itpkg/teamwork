class CreateTeamworkXlsCells < ActiveRecord::Migration
  def change
    create_table :teamwork_xls_cells do |t|
      t.integer :table_id, null:false
      t.integer :row, null:false
      t.integer :col, null:false
      t.integer :width, null:false
      t.integer :height, null:false
      t.integer :flag, null:false, default:0
      t.string :text, null:false, limit:1000
      t.timestamps null: false
    end
  end
end
