# Preview all emails at http://localhost:3000/rails/mailers/weekly_task
class WeeklyTaskPreview < ActionMailer::Preview
  def weekly_reminder
    WeeklyTaskMailer.weekly_reminder
  end
end
