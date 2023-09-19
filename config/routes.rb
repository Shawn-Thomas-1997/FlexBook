Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"
  get "profile", to: "pages#profile"
  get "certifications", to: "pages#certifications"
  get "calendar", to: "pages#calendar"
end
