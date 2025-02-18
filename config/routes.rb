Rails.application.routes.draw do
  get "pages/home"
  root "pages#home"
  resources :books
  get "up" => "rails/health#show", as: :rails_health_check
end
