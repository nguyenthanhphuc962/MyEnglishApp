class AddExamIdToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :exam, foreign_key: true
  end
end
