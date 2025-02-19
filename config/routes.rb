Rails.application.routes.draw do
  get "pages/home"
  root "pages#home"

  resources :books do
    member do
      post "borrow"
      post "return_book"
    end
  end

  resources :lending_histories, only: [ :index ]

  get "up" => "rails/health#show", as: :rails_health_check
end
