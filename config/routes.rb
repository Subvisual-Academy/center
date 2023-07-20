Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rails/welcome#index"
  resources :users do
    resources :friends, only: [:index], controller: "users/friends"
  end
  resources :questions do
    resources :answers, only: [:index], controller: "questions/answers"
  end
  resources :answers
  post "/auth/login", to: "authentication#login"
  get "/weekly_question", to: "week_question#show"
  get "/*path", to: "application#not_found"
end
