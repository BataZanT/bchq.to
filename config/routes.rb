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

  get "create_private", to: "links#new_private"
  post "create_private", to: "links#create_private"

  get "create_one_time", to: "links#new_one_time"
  post "create_one_time", to: "links#create_one_time"

  get "create_temporary", to: "links#new_temporary"
  post "create_temporary", to: "links#create_temporary"
  
  get "type_link", to: "links#type_link"

  get "l/:slug", to: "links#use"

  get "pwd/:id", to: "links#priv_validate"
  post "pwd_auth", to: "links#auth"

  delete "delete_link/:id",to: "links#destroy"

  get "accesses/:id", to: "accesses#index"
  get "accesses/today/:id", to: "accesses#index_today"
  get "accesses/date_search/:id",to: "accesses#date_search"
  get "accesses/ip_search/:id",to: "accesses#ip_search"

  get "up" => "rails/health#show", as: :rails_health_check
end
