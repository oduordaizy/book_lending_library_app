Rails.application.routes.draw do
  get "pages/home"
  root "pages#home"

  resources :books
    member do
      post "borrow"
      post "return_book"
    end

  resources :lending_histories, only: [ :index ]

  get "up" => "rails/health#show", as: :rails_health_check
end
