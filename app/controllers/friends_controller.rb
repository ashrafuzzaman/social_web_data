class FriendsController < ApplicationController

  before_filter :authenticate_with_token, :only => [:friend_reqests, :save_friend_requested, :accept_friend_req, :index]
  # POST /friends/handle_friend_req
  # params email=ashrafuzzaman.g2@gmail.com&friend_with=zmn.ashraf@gmail.com&shared_key=ASKDMQW123123
  def handle_friend_req
    @user = User.find_by_email(params[:friend_with])
    if !@user.friends.find_by_email(params[:email])
      @friend = @user.friends.create(:email => params[:email], :shared_key => params[:shared_key], :data_store => params[:data_store])
      @friend.receive_request!
      render :json => @friend
    else
      render :json => {:error => "already in friend list"}
    end

  end

  # params email=ashrafuzzaman.g2@gmail.com&friend_with=zmn.ashraf@gmail.com
  def accept_friend_req
    friend = current_user.friends.find_by_email(params[:friend_with])
    if friend
      friend.accept!
      render :json => friend
    else
      render :json => {:error => "Friend not found"}
    end

  end

  def accepted_friend_req
    user = User.find_by_email(params[:friend_with])
    friend = user.friends.find_by_email(params[:email])
    if friend.shared_key == params[:shared_key]
      friend.accept!
      render :json => friend
    else
      render :json => {:error => "Friend not found"}
    end
  end

  # POST /save_friend_reqested
  # params friend_with=zmn.ashraf@gmail.com&shared_key=ASKDMQW123123
  def save_friend_requested
    @friend = current_user.friends.create(:email => params[:friend_with], :shared_key => params[:shared_key], :data_store => params[:data_store])
    @friend.request!

    render :json => @friend
  end

  def attach_profile
    friend = current_user.friends.find_by_email(params[:friends_email])
    friend.profiles << Profile.find(params[:profile_id])
    render :json => friend
  end

  # get /friend_reqests
  def friend_reqests
    friends = current_user.friends.received_request
    render :json => {:friends => friends }
  end

  # GET /friends/new
  # GET /friends/new.json
  def new
    @friend = Friend.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @friend }
    end
  end

  # GET /friends
  # GET /friends.json
  def index
    friends = current_user.friends.accepted
    render :json => {:friends => friends }
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @friend }
    end
  end

  # GET /friends/new
  # GET /friends/new.json
  def new
    @friend = Friend.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @friend }
    end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new(params[:friend])

    respond_to do |format|
      if @friend.save
        format.html { redirect_to(@friend, :notice => 'Friend was successfully created.') }
        format.json  { render :json => @friend, :status => :created, :location => @friend }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friends/1
  # PUT /friends/1.json
  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        format.html { redirect_to(@friend, :notice => 'Friend was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to(friends_url) }
      format.json  { head :ok }
    end
  end
end
