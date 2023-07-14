Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rails/welcome#index"
  resources :users
  resources :questions
  resources :answers
  get "answers/question/:question_id", to: "answers#get_question"
  post "/auth/login", to: "authentication#login"
  get "/*", to: "application#not_found"
  get "/weekly_question", to: "week_question#show"
end
