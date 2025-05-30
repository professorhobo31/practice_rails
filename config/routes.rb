Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # GET /about
  get "about-us", to: "about#index", as: :about  # this line tells our app that whenever our server receives a GET request to the /about path, we send that user to the about CONTROLLER w/the index ACTION. Note how we changed it to about-us and it still works because of the link_to method. All the controller links, etc keep working as this

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "passwords", to: "passwords#edit" # We position our passwords routes here, and define the edit/update actions, as they will only ever be used by users already signed in
  patch "passwords", to: "passwords#update"

  get "password_reset", to: "password_resets#new"
  post "password_reset", to: "password_resets#create"
  get "password_reset/edit", to: "password_resets#edit"
  patch "password_reset/edit", to: "password_resets#update"

  # Root page
  root to: "main#index"   # with this line we're now creating the landing page of our app. Notice that we point to Rails that this will be the root of our project
end
