Rails.application.routes.draw do

  # get  "/questions/new" => "questions#new"
  # post "/questions" => "questions#create" as: :questions
  # get  "/questions/:id" => "questions#show", as: :question
  # get  "/questions" => "questions#index"
  # get  "/questions/:id/edit" => "questions#edit",  as: :edit_question

  get   "/" => "requests#index"
  get   "/requests/new" =>  "requests#new",     as: :new_request
  post  "/requests" =>      "requests#create",  as: :requests
  patch "/requests/:id" => "requests#update"
  get   "/requests/:id" =>  "requests#show",    as: :request
  get   "/requests" =>      "requests#index"
  get   "/requests/:id/edit" => "requests#edit", as: :edit_request
  get   "/requests/:id/done" => "requests#done", as: :done_request
  get   "/requests/:id/undone" => "requests#undone", as: :undone_request
  delete "/requests/:id/destroy" => "requests#destroy", as: :delete_request
  get "/requests/search/" => "requests#search", as: :search
  post "/requests/search/:id" => "requests#search_display"
end
