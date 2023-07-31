class WeeklyTaskMailer < ApplicationMailer
    default to: -> { User.all.pluck(:email) },
          from: 'no.reply@subvisual.academy'

    def weekly_reminder
        mail(subject: 'The Space Center: new weekly tasks!')
    end
end
