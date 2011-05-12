class ApiSessionController < Devise::SessionsController
  include Devise::Controllers::InternalHelpers

  #curl -d "email=ashrafuzzaman.g2@gmail.com&password=123456" http://localhost:3000/api/sign_in.json
  def api_sign_in
    params[:user] ||= {:email => params[:email], :password => params[:password]}
   
    #logger.info "User Info :: #{params[:user][:email]} #{params[:user][:password]}"
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    sign_in(resource_name, resource)
    current_user.reset_authentication_token!
    render :json => current_user.to_json(:only => [:email, :authentication_token])
  end
end
