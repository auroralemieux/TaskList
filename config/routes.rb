Rails.application.routes.draw do
  get 'days/index'

  get 'days/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'

  get "/tasks", to: "tasks#index"
  get "/tasks/:id", to: "tasks#show", as: "task"
  get "/new", to: "tasks#new", as: "new"

end
