class WeeklyQuestionSerializer
  include Alba::Resource

  attributes :id, :week

  attribute :during do |resource|
    start_week = resource.week - 7
    end_week = resource.week - 1
    "#{start_week.strftime("%d/%m")}-#{end_week.strftime("%d/%m")} "
  end

  one :question
end
