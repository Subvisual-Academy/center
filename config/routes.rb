Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rails/welcome#index"
  resources :questions do
    resources :answers, only: [:index], controller: "questions/answers"
  end
  resources :answers
  resources :weeekly_friends, only: [:show], controller: "weekly_friends"
  post "/auth/login", to: "authentication#login"
  get "/weekly_question", to: "week_question#show"
  get "/*path", to: "application#not_found"
end
