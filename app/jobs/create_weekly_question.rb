class Jobs::CreateWeeklyQuestion < ApplicationJob
  queue_as :default

  def perform(*args)
    used_questions = WeeklyQuestion.pluck(:question_id)
    selected_question = Question.where.not(id: used_questions).order("RANDOM()").first

    WeeklyQuestion.create(question: selected_question, week: Date.today.end_of_week + 1.day)
  end
end
