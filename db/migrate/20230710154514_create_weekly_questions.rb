class CreateWeeklyQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :weekly_questions do |t|
      t.references :question, null: false, foreign_key: true
      t.date :week, null: false

      t.timestamps
    end

    add_index :weekly_questions, :week, unique: true
  end
end
