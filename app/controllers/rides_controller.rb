class RidesController < ApplicationController
	
	RIDE_REQUEST_VALS_TO_BOOL_MAPPINGS = {
		'need_a_ride' => true,
		'have_a_ride' => false
	}

	def all
		@rides = Ride.all

		respond_to do |format|
			format.html # all.html.erb
			format.json { render json: { rides: @rides.as_json(root: false) } }
		end
	end

	# GET /rides
  # GET /rides.json
  def index
		
		@rides ||= Ride.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rides }
    end
  end

  # GET /rides/1
  # GET /rides/1.json
  def show

		@ride ||= Ride.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ride, :methods => :nearby }
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
		
		@checked_bool_for_need_a_ride = @ride.request == true ? true : false
		@checked_bool_for_have_a_ride = @ride.request == false ? true : false
  end

  # POST /rides
  # POST /rides.json
  def create
		set_request_param_from_request_val(params[:ride][:request])
	
		@ride = Ride.new(params[:ride])

    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: 'Your request for a ride has been submitted. Good luck!' }
        format.json { render json: @ride, status: :created, location: @ride }
      else
        format.html { render action: "new" }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rides/1
  # PUT /rides/1.json
  def update
   	set_request_param_from_request_val(params[:ride][:request])

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

	def set_request_param_from_request_val(request)
	  params[:ride][:request] = RIDE_REQUEST_VALS_TO_BOOL_MAPPINGS[request]
	end

end
