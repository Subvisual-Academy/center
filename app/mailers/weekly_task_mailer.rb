class WeeklyTaskMailer < ApplicationMailer
  def weekly_reminder
    emails = User.all.pluck(:email)
    mail(to: emails, subject: "The Space Center: new weekly tasks!")
  end
end
