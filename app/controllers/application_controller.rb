class ApplicationController < ActionController::Base
  protect_from_forgery
  def load_user
    @user = User.find_by_email(params[:email])
    current_user ||= @user
  end

  def authenticate_with_token
    load_user
    if @user.present? && @user.authentication_token == params[:auth_token]
      true
    else
      render :json => {:error => "Invalid authentication token"}
      false
    end
  end
end
