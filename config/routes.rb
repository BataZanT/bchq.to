Rails.application.routes.draw do
  root "main#home"
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "delete_account", to: "registrations#goodbye"
  delete "delete_account", to: "registrations#destroy"
  
  get "log_in", to: "sessions#new"
  post "log_in", to: "sessions#create"

  delete "log_out", to: "sessions#destroy"

  get "profile", to: "users#profile"
  
  get "my_links", to: "links#index"
  
  get "create_link", to: "links#new"
  post "create_link", to: "links#create"

  get "up" => "rails/health#show", as: :rails_health_check
end
