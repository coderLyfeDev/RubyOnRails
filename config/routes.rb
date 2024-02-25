Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :educations
      resources :user_infos
      resources :user_roles
      resources :careers
      resources :career_interests do
        delete 'delete_by_user_and_career', on: :collection
      end
      resources :connecteds
      resources :work_histories
      resources :posts
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
