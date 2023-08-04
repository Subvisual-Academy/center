class AnswerSerializer
  include Alba::Resource

  attributes :id, :body, :created_at, :updated_at

  one :user
end
