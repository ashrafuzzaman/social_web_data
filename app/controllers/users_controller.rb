class UsersController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def clear
    User.delete_all
    Comment.delete_all
    Friend.delete_all
    ProfileAttribute.delete_all
    Profile.delete_all
    Status.delete_all
    ActiveRecord::Base.connection.execute("DELETE from profiles_attributes")
    ActiveRecord::Base.connection.execute("DELETE from profiles_friends")
    #Profile.find_by_sql("Select * from profiles_friends")
    redirect_to "/"
  end

end
