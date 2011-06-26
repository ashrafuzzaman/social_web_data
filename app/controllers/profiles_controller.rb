class ProfilesController < ApplicationController
  before_filter :authenticate_with_token
  # GET /profiles
  # GET /profiles.xml
  # curl "http://localhost:3000/profiles.json?email=ashrafuzzaman.g2@gmail.com&auth_token=7thDNCGZCkKwrtGVHbn0"
  # result :: [{"profile":{"name":"MasterProfile","created_at":"2011-06-01T19:09:50Z","updated_at":"2011-06-01T19:09:50Z","id":1,"user_id":1,"active":true}}]
  def index
    @profiles = current_user.profiles

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profiles }
      format.json  { render :json => {:profiles => @profiles} }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = current_user.profiles.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
      format.json  { render :json => @profile }

    end
  end

  # GET /profiles/new
  # GET /profiles/new.xml
  def new
    @profile = current_user.profiles.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile }
      format.json  { render :json => @profile }

    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.xml
  # curl -d "profile[name]=MasterProfile&email=ashrafuzzaman.g2@gmail.com&auth_token=7thDNCGZCkKwrtGVHbn0" http://localhost:3000/profiles.json
  def create
    @profile = current_user.profiles.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to(@profile, :notice => 'Profile was successfully created.') }
        format.xml  { render :xml => @profile, :status => :created, :location => @profile }
        format.json  { render :json => @profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
        format.json  { render :json => {:error => @profile.errors.full_messages} }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = current_user.profiles.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
        format.json  { render :json => @profile }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
        format.json  { render :json => {:error => @profile.errors.full_messages} }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = !params[:name].nil? ? current_user.profiles.find_by_name(params[:name]) : current_user.profiles.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
      format.json  { render :json => {:status => "SUCCESS"} }
    end
  end

  # GET /profile/:ID/attributes.json
  # curl "http://localhost:3000/profiles/1/attributes.json?email=ashrafuzzaman.g2@gmail.com&auth_token=0401QHdx5Nll9UNHP2Lv"
  def attributes
    @profile = current_user.profiles.find(params[:id])

    respond_to do |format|
      format.json  { render :json => @profile.profile_attributes }
    end
  end

  # GET /profile/:ID/all_attributes.json
  # curl "http://localhost:3000/profiles/3/all_attributes.json?email=ashrafuzzaman.g2@gmail.com&auth_token=7w38pGIRZ1cS1fpVpP9C"
  def all_attributes
    @profile = current_user.profiles.find(params[:id])
    profile_attributes = @profile.profile_attributes
    all_attributes = current_user.profile_attributes

    all_attributes.each { |profile_attribute| 
        profile_attributes.each { |pa|
          profile_attribute.selected = true if pa.id == profile_attribute.id
        }
    }
    
    all_attributes_json = []
    all_attributes.each { |attr|
      all_attributes_json << {:profile_attribute => {:id => attr.id, :name => attr.name, :value => attr.value, :attribute_type => attr.attribute_type, :selected => (attr.selected == true)}} 
    }
    
    respond_to do |format|
      format.json  { render :json => {:profile_attributes => all_attributes_json }}
    end
  end

  # POST /profile/:ID/create_attributes
  # curl -d "email=ashrafuzzaman.g2@gmail.com&auth_token=0401QHdx5Nll9UNHP2Lv&ids=2,3" http://localhost:3000/profiles/1/create_attributes.json
  def create_attributes
    @profile = current_user.profiles.find(params[:id])
    @profile.profile_attribute_ids = params[:ids]
    
    respond_to do |format|
      format.json  { render :json => @profile.profile_attributes }
    end
  end

end
