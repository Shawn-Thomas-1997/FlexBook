Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: :show
  root to: "pages#home"
  get "profile", to: "pages#profile"
  get "calendar", to: "pages#calendar"
  resources :certifications, only: [:index,:new, :create, :destroy]
  resources :listings, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, :reviews, only: [:index, :new, :create, :show]
  end
  resources :bookings, :reviews, only: [:destroy]
end
