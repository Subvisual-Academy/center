class AddUniqueAnswer < ActiveRecord::Migration[7.0]
  def change
    add_index :answers, [:user_id, :question_id], unique: true
  end
end
