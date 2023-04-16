Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :listings, only: %i[index show new create]
  resources :bookings, only: %i[index show new create] do
  # additional routes:
    member do
      patch :update # This is for approval route
      # get :back # This is for a back button route
    end
  end
end
