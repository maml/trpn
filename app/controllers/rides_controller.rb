class RidesController < ApplicationController

	before_filter :distill_params, :only => [:create, :update]
  before_filter :set_request_param_from_request_val, :only => [:create, :update]

	# GET /rides
  # GET /rides.json
  def index
		
		@rides ||= Ride.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: { rides: @rides.as_json(root: false) } }
    end
  end

  # GET /rides/1
  # GET /rides/1.json
  def show

		@ride ||= Ride.find(params[:id])
		#@username= @ride.user.username

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: { ride: @ride.as_json }, :methods => :nearby }
    end
  end

  # GET /rides/new
  # GET /rides/new.json
  def new
		@ride = Ride.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ride }
    end
  end

  # GET /rides/1/edit
  def edit
		@ride = Ride.find(params[:id])
		
		@looking = @ride.request == true ? true : false
		@offering = @ride.request == false ? true : false
  end

  # POST /rides
  # POST /rides.json
  def create
		@ride = Ride.new(params[:ride])

    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: 'Your request for a ride has been submitted. Good luck!' }
				format.json { render json: { ride: @ride.as_json }, status: :created, location: @ride }
      else
        format.html { render action: "new" }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rides/1
  # PUT /rides/1.json
  def update
		@ride = Ride.find(params[:id])

    respond_to do |format|
      if @ride.update_attributes(params[:ride])
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
		@ride = Ride.find(params[:id])
    @ride.destroy

    respond_to do |format|
      format.html { redirect_to rides_path }
      format.json { head :no_content }
    end
  end

	private

	# Instances of Ride have a boolean attribute, request, that is meant to indicate wether
	# or not it is a ride being offered (request = false) or a ride being sought (request = true).
	# On the forms, rides/_form & users/rides/_form, there are two radio buttons for request, one with 
	# a value of 'looking' and the other with a value of 'offering'. These are mapped to true
	# and false, respectively, in RIDE_REQUEST_VALS_TO_BOOL_MAPPINGS and then set back to a
	# boolean in set_request_param_from_request_val before creating or updating.
	#
	# If the param comes in as a boolean, that same boolean is returned.
	
	RIDE_REQUEST_VALS_TO_BOOL_MAPPINGS = {
		true 				=> true,
		'looking' 	=> true,
		false 			=> false,
		'offering' 	=> false
	}

	def set_request_param_from_request_val
	  params[:ride][:request] = RIDE_REQUEST_VALS_TO_BOOL_MAPPINGS[params[:ride][:request]]
	end

	def distill_params
		["address", "latitude", "longitude"].each do |blacklisted_key|
			params[:ride].delete_if { |key| key == blacklisted_key }
		end
	end

end
