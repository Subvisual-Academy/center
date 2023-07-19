class CreateWeeklyActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :weekly_activities do |t|
      t.references :user_1, null: false, foreign_key: {to_table: "users"}
      t.references :user_2, null: false, foreign_key: {to_table: "users"}

      t.timestamps
    end
  end
end
