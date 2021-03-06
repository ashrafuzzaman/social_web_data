class ApplicationController < ActionController::Base
  protect_from_forgery
  def load_user
    @user = User.find_by_email(params[:email])
    current_user ||= @user
  end

  def authenticate_with_token
    if !params[:email]
      render :json => {:error => "email is empty"}
    return
    elsif !params[:auth_token]
      render :json => {:error => "auth_token is empty"}
    return
    end

    load_user
    if @user.present? && @user.authentication_token == params[:auth_token]
    true
    else
      render :json => {:error => "Invalid authentication token"}
    false
    end
  end

  def authenticate_friend
    if !params[:email] || !params[:friends_email] || !params[:shared_key]
      render :json => {:error => "Prams missing"}
      return
    end

    @user = User.find_by_email(params[:email])
    @friend = Friend.find_by_email(params[:friends_email])
    if !@friend.present?
      render :json => {:error => "Friend not present"}
      return false
    end
    if !@friend.accepted?
      render :json => {:error => "Friend not accepted"}
      return false
    end
    if @friend.shared_key == params[:shared_key]
      true
    else
      render :json => {:error => "Invalid authentication"}
      false
    end
  end

  def auth_user_or_friend
    if !params[:email] && !params[:auth_token]
      return authenticate_with_token
    else
      return authenticate_friend
    end
    return false
  end
end
