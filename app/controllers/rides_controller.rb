class RidesController < ApplicationController

	before_filter :load_user

	RIDE_REQUEST_VALS_TO_BOOL_MAPPINGS = {
		'need_a_ride' => true,
		'have_a_ride' => false
	}

	# GET /rides
  # GET /rides.json
  def index
		@rides = @user.rides.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rides }
    end
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
		@ride = @user.rides.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ride }
    end
  end

  # GET /rides/new
  # GET /rides/new.json
  def new
		@ride = @user.rides.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ride }
    end
  end

  # GET /rides/1/edit
  def edit
		@ride = @user.rides.find(params[:id])
		
		@checked_bool_for_need_a_ride = @ride.request == true ? true : false
		@checked_bool_for_have_a_ride = @ride.request == false ? true : false
  end

  # POST /rides
  # POST /rides.json
  def create
		set_request_param_from_request_val(params[:ride][:request])
	
		@ride = @user.rides.new(params[:ride])

    respond_to do |format|
      if @ride.save
        format.html { redirect_to [@user, @ride], notice: 'Your request for a ride has been submitted. Good luck!' }
        format.json { render json: [@user, @ride], status: :created, location: [@user, @ride] }
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

		@ride = @user.rides.find(params[:id])

    respond_to do |format|
      if @ride.update_attributes(params[:ride])
        format.html { redirect_to [@user, @ride], notice: 'Ride was successfully updated.' }
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
		@ride = @user.rides.find(params[:id])
    @ride.destroy

    respond_to do |format|
      format.html { redirect_to user_rides_path(@user) }
      format.json { head :no_content }
    end
  end

	private

	def set_request_param_from_request_val(request)
	  params[:ride][:request] = RIDE_REQUEST_VALS_TO_BOOL_MAPPINGS[request]
	end

	def load_user
		@user = User.find(params[:user_id])
	end
end
