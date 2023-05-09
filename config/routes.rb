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
    resources :buildings
  end

  devise_for :admin, skip: :registrations, controllers: {
    sessions: "admin/devise/sessions",
    passwords: "admin/devise/passwords"
  }

  devise_for :users, controllers: {
    registrations: "users/devise/registrations",
    sessions: "users/devise/sessions",
    passwords: "users/devise/passwords",
    confirmations: "users/devise/confirmations"
  }

  namespace :users do
    resources :class_schedules, only: [:index]
    resources :academic_calendars, only: [:index]
  end
end
