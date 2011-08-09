class StatusesController < ApplicationController
  before_filter :authenticate_with_token, :except => [:friends_status]
  before_filter :authenticate_friend, :only => [:friends_status]
  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = @user.status.all(:limit => 5)
    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => { :statuses => @statuses } }
    end
  end

  def friends_status
    profile_ids = @friend.profile_ids
    @statuses = @user.status.all(:conditions => [ "profile_id IN (?)", profile_ids], :limit => 5)
    render :json => { :statuses => @statuses }
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    @status = Status.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @status }
    end
  end

  # GET /statuses/new
  # GET /statuses/new.json
  def new
    @status = Status.new

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @status }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(params[:status])
    @status.user = current_user

    respond_to do |format|
      if @status.save
        format.html { redirect_to(@status, :notice => 'Status was successfully created.') }
        format.json  { render :json => {:status => @status} }
      else
        format.html { render :action => "new" }
        format.json  { render :json => {:error => @status.errors} }
      end
    end
  end

  # PUT /statuses/1
  # PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status])
        format.html { redirect_to(@status, :notice => 'Status was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to(statuses_url) }
      format.json  { head :ok }
    end
  end
end
