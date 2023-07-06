class WeeklyActivityJob < ApplicationJob
  queue_as :default
  require 'csv'

  def perform(*args)
    Question.create(title: "Week" + Question.maximum(:id).next.to_s, content: csvfile.read("../lib/questions/questions.csv"))
  end
end
