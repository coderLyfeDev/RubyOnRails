Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :educations do
        get 'get_by_user', on: :collection
      end
      resources :user_infos do
        collection do
          post 'login'
        end
        collection do
          get 'search_users_with_details'
        end
      end
      resources :user_roles
      resources :careers do
        get 'not_interested/:userId', to: 'careers#careers_not_interested', on: :collection
      end
      resources :career_interests do
        delete 'delete_by_user_and_career', on: :collection
        get 'get_by_user', on: :collection
      end
      resources :work_histories do
        get 'get_by_user', on: :collection
      end
      resources :posts do
        get 'get_by_user', on: :collection
      end
      resources :connecteds do
        get 'get_by_user', on: :collection
      end
    end
  end
end
