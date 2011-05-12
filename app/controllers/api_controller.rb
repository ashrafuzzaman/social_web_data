class ApiController < ApplicationController
  before_filter :load_user, :except => [:user_register]
  before_filter :authenticate_with_token, :except => [:user_register]

  #curl -d "email=test@test.com&password=123456" http://localhost:3000/api/users.json
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

  #curl -d "email=ashrafuzzaman.g2@gmail.com&auth_token=123456&data_service_host=http://social-web.heroku.com/" http://localhost:3000/api/update_data_service_host.json
  def update_data_service_host
    @user.update_attribute(:data_service_host, params[:data_service_host])
    render :json => @user.to_json(:only => [:email, :data_service_host])
  end

  #curl -d "email=ashrafuzzaman.g2@gmail.com&auth_token=123456&emails=ashrafuzzaman.g2@gmail.com,test@test.com" http://localhost:3000/api/data_service_hosts.json
  def data_service_hosts
    emails = params[:emails].gsub(/[ ]/, '').split(',')
    users = User.find_all_by_email(emails, :select => 'email, data_service_host')
    logger.info "users :: #{users.inspect}"
    render :json => {:users => users}
  end
end
