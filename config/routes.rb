Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :listings, only: %i[index show new create]
  resources :bookings, only: %i[index show new create] do
  # approval booking route
    member do
      patch :update
    end
  end
end
