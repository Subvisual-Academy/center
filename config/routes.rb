Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rails/welcome#index"
  resources :users
  post "/auth/login", to: "authentication#login"
  get "/*", to: "application#not_found"
end
