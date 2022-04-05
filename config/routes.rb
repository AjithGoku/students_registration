Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "students#index"
  # get "/students", to: "students#index"
  # get "/students/:id", to: "students#show"
  resources :students
end
