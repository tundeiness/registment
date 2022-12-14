Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/dashboard' => 'equipment#index'
  namespace :api do
    namespace :v1 do
      #  user resources
      resources :users
      resources :equipments
    end
  end
end
