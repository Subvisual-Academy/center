questions = [
  {title: "What is the meaning of life?", content: "I am having an existential crisis and need some help."},
  {title: "What is the best way to cook a steak?", content: "I have a steak and I want to eat it."},
  {title: "How do I get a job as a developer?", content: "I am a recent bootcamp grad and I am having trouble finding a job."}
]

questions.each do |question|
  next if Question.exists?(title: question[:title], content: question[:content])

  Question.create(question)
end
