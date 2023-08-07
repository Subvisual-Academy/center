class AddActiveToWeeklyActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :weekly_activities, :active, :boolean, default: true
  end
end
