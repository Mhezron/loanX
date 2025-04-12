Rails.application.routes.draw do
  resources :customers

  get "up" => "rails/health#show", as: :rails_health_check

  root "customers#index"
end
