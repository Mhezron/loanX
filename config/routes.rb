Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :customers

  get "up" => "rails/health#show", as: :rails_health_check

  root "customers#index"
end
