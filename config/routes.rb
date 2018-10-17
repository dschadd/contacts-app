Rails.application.routes.draw do
  namespace :api do
    get "/contacts" => "contacts#index"
    get "/contacts/:id" => "contacts#show"
  end
end
