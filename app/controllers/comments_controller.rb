class CommentsController < ApplicationController
  before_filter :authenticate_with_token
  def index
    @friend = Friend.find_by_email(params[:friends_email])
    comments = Comment.find(:all, :conditions => {
      :resource_type => params[:resource_type],
      :resource_id => params[:resource_id],
      :friend_id => @friend.id,
      :user_id => current_user.id
    })

    render :json => {:comments => comments}
  end

  def post_comment
    comment = Comment.create(:resource_type => params[:resource_type], :resource_id => params[:resource_id], :comment => params[:comment], :user_id => current_user.id )
    render :json => comment
  end

  def post_comment_on_friend
    @friend = Friend.find_by_email(params[:friends_email])
    comment = Comment.create(:resource_type => params[:resource_type], :resource_id => params[:resource_id], :comment => params[:comment], :friend_id => @friend.id, :user_id => current_user.id )
    render :json => comment
  end
end
