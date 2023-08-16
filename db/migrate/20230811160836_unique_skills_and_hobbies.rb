class UniqueSkillsAndHobbies < ActiveRecord::Migration[7.0]
  def change
    add_index :skill_users, [:user_id, :skill_id], unique: true
    add_index :hobby_users, [:user_id, :hobby_id], unique: true
  end
end
