class ChangeQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :title
    rename_column :questions, :content, :body
  end
end
