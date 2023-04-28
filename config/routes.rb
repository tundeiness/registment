Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/logged' => 'members#index'
  get '/members' => 'members#all_users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/dashboard' => 'equipment#index'
  namespace :api do
    namespace :v1 do
      #  user resources
      # rairesources :users
      resources :bookings
      resources :equipment_conditions, only: [:index]
      resources :equipments do
        collection do
          get 'booking_count'
        end
      end
    end
  end
end
