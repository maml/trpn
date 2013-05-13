class Users::RidesController < RidesController

	before_filter :load_user

	# GET /users/:id/rides
	# GET /users/:id/rides.json
	def index
		@rides = @user.rides.all
		super
	end

	# GET /users/:id/rides/1
	# GET /users/:id/rides/1.json
	def show
		@ride = @user.rides.find(params[:id])
		super
	end
	
	# GET /users/:id/rides/new
	# GET /users/:id/rides/new.json
	def new
		@ride = @user.rides.new
		super
	end

	# POST /users/:id/rides
	# POST /users/:id/rides.json
	def create
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

	# PUT /users/:id/rides/1
	# PUT /users/:idrides/1.json
	def update
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

	def destroy
		@ride = @user.rides.find(params[:id])
		@ride.destroy

		respond_to do |format|
			format.html { redirect_to user_rides_path }
			format.json { head :no_content}
		end
	end

	private

	def load_user
		if params[:user_id].present?
			@user = User.find(params[:user_id])
		end
	end

end
