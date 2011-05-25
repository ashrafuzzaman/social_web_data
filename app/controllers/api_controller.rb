class ApiController < ApplicationController
  before_filter :authenticate_with_token, :except => [:user_register]

  #curl -d "email=ashrafuzzaman.g2@gmail.com&password=123456" http://localhost:3000/api/users.json
  def user_register
    logger.info "User Info :: #{params[:email]} #{params[:password]}"
    @user = User.create(:email => params[:email], :password => params[:password], :data_service_host => "http://social-web-data.heroku.com")

    if @user.valid?
      @user.reset_authentication_token!
      render :json => @user.to_json(:only => [:email, :authentication_token])
    else
      render :json => {:error => @user.errors.full_messages}
    end
  end

end
