class CommentsController < ApplicationController
  before_filter :authenticate_with_token, :except => [:comments_of_friend]
  before_filter :authenticate_friend, :only => [:comments_of_friend]

  def index
    friend = Friend.find_by_email(params[:friends_email])
    conditions = {
      :resource_type => params[:resource_type],
      :resource_id => params[:resource_id],
      :user_id => current_user.id
    }    
    conditions.merge!({:friend_id => friend.id}) if friend

    comments = Comment.find(:all, :conditions => conditions)

    render :json => {:comments => comments}
  end

  def comments_of_friend
    comments = Comment.find(:all, :conditions => {
      :resource_type => params[:resource_type],
      :resource_id => params[:resource_id],
      :friend_id => @friend.id,
      :user_id => current_user.id
    })

    render :json => {:comments => comments}
  end

  def post_comment
    comment_hash = {:resource_type => params[:resource_type], :resource_id => params[:resource_id], :comment => params[:comment], :user_id => current_user.id }
    if params[:friends_email]
      friend = Friend.find_by_email(params[:friends_email])
      comment_hash.merge!({:friend_id => friend.id})
    end

    comment = Comment.create(comment_hash)
    render :json => comment
  end

end
