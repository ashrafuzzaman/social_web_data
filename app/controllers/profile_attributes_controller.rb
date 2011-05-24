class ProfileAttributesController < ApplicationController
  # GET /profile_attributes
  # GET /profile_attributes.xml
  def index
    @profile_attributes = ProfileAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_attributes }
      format.json  { render :json => @profile_attributes }
    end
  end

  # GET /profile_attributes/1
  # GET /profile_attributes/1.xml
  def show
    @profile_attribute = ProfileAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_attribute }
    end
  end

  # GET /profile_attributes/new
  # GET /profile_attributes/new.xml
  def new
    @profile_attribute = ProfileAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_attribute }
    end
  end

  # GET /profile_attributes/1/edit
  def edit
    @profile_attribute = ProfileAttribute.find(params[:id])
  end

  # POST /profile_attributes
  # POST /profile_attributes.xml
  def create
    @profile_attribute = ProfileAttribute.new(params[:profile_attribute])

    respond_to do |format|
      if @profile_attribute.save
        format.html { redirect_to(@profile_attribute, :notice => 'Profile attribute was successfully created.') }
        format.xml  { render :xml => @profile_attribute, :status => :created, :location => @profile_attribute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_attributes/1
  # PUT /profile_attributes/1.xml
  def update
    @profile_attribute = ProfileAttribute.find(params[:id])

    respond_to do |format|
      if @profile_attribute.update_attributes(params[:profile_attribute])
        format.html { redirect_to(@profile_attribute, :notice => 'Profile attribute was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_attributes/1
  # DELETE /profile_attributes/1.xml
  def destroy
    @profile_attribute = ProfileAttribute.find(params[:id])
    @profile_attribute.destroy

    respond_to do |format|
      format.html { redirect_to(profile_attributes_url) }
      format.xml  { head :ok }
    end
  end
end
