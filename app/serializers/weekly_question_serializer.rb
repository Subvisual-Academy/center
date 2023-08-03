class WeeklyQuestionSerializer
  include Alba::Resource

  attributes :id, :week, :created_at, :updated_at

  one :question
end
