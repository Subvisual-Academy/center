# The serialization result is the same as above
class QuestionSerializer
  include Alba::Resource

  attributes :id, :body, :created_at, :updated_at

  many :answers
end
