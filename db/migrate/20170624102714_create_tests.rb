class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.datetime :date_test
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
