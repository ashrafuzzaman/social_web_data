SocialWebData::Application.routes.draw do
  resources :statuses

  resources :friends do
    collection do
      post 'handle_friend_req'
      post 'save_friend_requested'
      get 'friend_reqests'
      post 'accept_friend_req'
      post 'accepted_friend_req'
    end
  end

  resources :profile_attributes

  resources :profiles do
    member do
      get 'attributes'
      get 'all_attributes'
      post 'create_attributes'
    end
  end

  devise_for :users, :controllers => {:sessions => 'api_session'}, :skip => [:sessions] do
    post 'api/sign_in' => 'api_session#api_sign_in'
    post 'users/sign_in', :to => 'devise/sessions#create', :as => 'user_session'
  end

  match 'users' => 'users#index'
  match 'users/clear' => 'users#clear'
  post 'api/users' => 'api#user_register'

  resources :notification do
    collection do
      get 'friend_requests'
    end
  end

end
