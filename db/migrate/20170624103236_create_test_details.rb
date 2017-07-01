class CreateTestDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :test_details do |t|
      t.references :test, foreign_key: true
      t.references :exam, foreign_key: true
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps

    end
    
    add_index :test_details, [:test_id, :exam_id], unique: true
  end
end
