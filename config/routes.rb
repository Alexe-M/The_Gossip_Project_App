Rails.application.routes.draw do

  get "static_pages/home"
  get "static_pages/team"
  get "static_pages/contact"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get '/welcome', to: 'static#index' 

  root 'gossips#index'   # page d'accueil


  # pour voir toutes les routes --> rails routes
  # Routes automatisée pour les potins
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]

  resources :gossips do
    resources :comments
  end

  # Routes en manuel
  # get "/gossips", to: "gossips#index"
  # get "/gossips/:id", to: "gossips#show"
  # get "/gossips/new", to: "gossips#new"
  # post "/gossips", to: "gossips#create"  # reçoit de l'info d'un formulaire donc verbe POST
  # get "/gossips/:id/edit", to: "gossips#edit"
  # put "/gossips/:id", to: "gossips#update" # reçoit de l'info d'un formulaire donc verbe PUT
  # delete "/gossips/:id", to: "gossips#destroy" # une requête un peu spéciale pour supprimer donc verbe DELETE
  
  get '/team', to: 'static_pages#team'  # Page "team"
  get '/contact', to: 'static_pages#contact'  # Page "contact"
  
  
  get 'welcome/:first_name', to: 'static_pages#welcome', as: 'welcome'





  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
