Rails.application.routes.draw do

  devise_for :users, 
    path: '', 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'api/v1/users/sessions',
      registrations: 'api/v1/users/registrations'
    }

  post '/api/v1/firebase_login', to: 'api/v1/users/firebase_sessions#create'
 
  namespace :api do
    namespace :v1 do
      resources :vets do
        resources :clients do
          resources :animals
        end
      end
    end 
  end

  resources :vets

  # ... other API resources
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
