Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      # authentication with knock
      post 'user_token' => 'user_token#create'

      # authentication with jwt
      post :auth, to: 'authentication#create'

      # location resources routes
      resources :locations do
        resources :recordings
      end
    end
  end

  resources :locations
  root to: 'locations#index'
end
