Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :venues do
    resources :bookings, only: %i[new create]
    resources :venue_offers, only: %i[create edit new update destroy]
  end

  resources :users, only: %i[show edit update]
  resources :bookings, only: %i[index show destroy]
  resources :bookings, only: [] do
    # missing routes to display bookings on the venues
    # should we add a route to display availability for booking?
    resources :reviews, only: %i[create new]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
