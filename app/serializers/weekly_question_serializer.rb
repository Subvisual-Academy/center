class WeeklyQuestionSerializer
  include Alba::Resource

  attributes :id, :week

  attribute :formatted_week do |resource|
    start_week = resource.week
    end_week = resource.week + 6
    "#{start_week.strftime("%d/%m")}-#{end_week.strftime("%d/%m")} "
  end

  one :question
end
