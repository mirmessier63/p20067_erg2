Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  get "up" => "rails/health#show", as: :rails_health_check

  get "/", to: redirect("/todos")

  resources :todos do
    resources :items
  end

  post "auth/login", to: "authentication#authenticate"
  post "signup", to: "users#create"
end
