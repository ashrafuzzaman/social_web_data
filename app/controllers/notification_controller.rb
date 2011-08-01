class NotificationController < ApplicationController

  before_filter :authenticate_with_token
  def friend_requests
    friend_requests = current_user.friends.received_request
    render :json => {:friend_requests => friend_requests}
  end
end
