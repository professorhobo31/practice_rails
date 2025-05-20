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
  get "about", to: "about#index"  # this line tells our app that whenever our server receives a GET request to the /about path, we send that user to the about CONTROLLER w/the index ACTION

  # Root page
  root to: "main#index"   # with this line we're now creating the landing page of our app. Notice that we point to Rails that this will be the root of our project
end
