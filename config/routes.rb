Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :academic_calendars
    resources :semesters
    resources :graduation_requirements
    resources :class_schedules
  end

  devise_for :admin, skip: :registrations, controllers: {
    sessions: "admin/devise/sessions",
    passwords: "admin/devise/passwords"
  }

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
end
