Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :venues do
    resources :reviews
    resources :bookings
    resources :venue_offers, only: %i[create edit new update destroy]
  end
  resources :users, only: %i[show edit update]

  # Defines the root path route ("/")
  # root "articles#index"
end
