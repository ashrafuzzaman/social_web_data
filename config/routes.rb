SocialWebData::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => 'api_session'}, :skip => [:sessions] do
    post 'api/sign_in' => 'api_session#api_sign_in'
    post 'users/sign_in', :to => 'devise/sessions#create', :as => 'user_session'
  end

  post 'api/users' => 'api#user_register'

end
