class ProfileAttributesController < ApplicationController
  before_filter :authenticate_with_token
  # GET /profile_attributes
  # GET /profile_attributes.xml
  # curl "http://localhost:3000/profile_attributes.json?email=ashrafuzzaman.g2@gmail.com&auth_token=0401QHdx5Nll9UNHP2Lv"
  def index
    @profile_attributes = current_user.profile_attributes

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_attributes }
      format.json  { render :json => @profile_attributes }
    end
  end

  # GET /profile_attributes/1
  # GET /profile_attributes/1.xml
  def show
    @profile_attribute = current_user.profile_attributes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_attribute }
      format.json  { render :json => @profile_attribute }
    end
  end

  # GET /profile_attributes/new
  # GET /profile_attributes/new.xml
  def new
    @profile_attribute = current_user.profile_attributes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_attribute }
      format.json  { render :json => @profile_attribute }
    end
  end

  # GET /profile_attributes/1/edit
  def edit
    @profile_attribute = current_user.profile_attributes.find(params[:id])
  end

  # POST /profile_attributes
  # POST /profile_attributes.xml
  # curl -d "email=ashrafuzzaman.g2@gmail.com&auth_token=0401QHdx5Nll9UNHP2Lv&profile_attribute[name]=First name" http://localhost:3000/profile_attributes.json
  def create
    @profile_attribute = current_user.profile_attributes.new(params[:profile_attribute])

    respond_to do |format|
      if @profile_attribute.save
        format.html { redirect_to(@profile_attribute, :notice => 'Profile attribute was successfully created.') }
        format.xml  { render :xml => @profile_attribute, :status => :created, :location => @profile_attribute }
        format.json  { render :json => @profile_attribute, :status => :created }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_attribute.errors, :status => :unprocessable_entity }
        format.json { render :json => {:error => @profile_attribute.errors.full_messages} }
      end
    end
  end

  # PUT /profile_attributes/1
  # PUT /profile_attributes/1.xml
  def update
    @profile_attribute = current_user.profile_attributes.find(params[:id])

    respond_to do |format|
      if @profile_attribute.update_attributes(params[:profile_attribute])
        format.html { redirect_to(@profile_attribute, :notice => 'Profile attribute was successfully updated.') }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_attribute.errors, :status => :unprocessable_entity }
        format.json { render :json => {:error => @profile_attribute.errors.full_messages} }
      end
    end
  end

  # DELETE /profile_attributes/1
  # DELETE /profile_attributes/1.xml
  def destroy
    @profile_attribute = current_user.profile_attributes.find(params[:id])
    @profile_attribute.destroy

    respond_to do |format|
      format.html { redirect_to(profile_attributes_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
