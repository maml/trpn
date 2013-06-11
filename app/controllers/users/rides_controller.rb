class Users::RidesController < RidesController

	before_filter :load_user
	before_filter :authenticate_user!, except: [:index, :show]

	# GET /users/:id/rides
	# GET /users/:id/rides.json
	def index
		@rides = @user.rides.all
		super
	end

	def new
		# if the current user tries to hit another user's new ride page, users/:id/rides/new,
		# we redirect them to that user's rides page: users/:id/rides
		if current_user != @user
			redirect_to user_rides_path(@user)
			return
		end
		super
	end

	# POST /users/:id/rides
	# POST /users/:id/rides.json
	def create
		@ride = current_user.rides.new(params[:ride])
		
		respond_to do |format|
			if @ride.save
				format.html { redirect_to [current_user, @ride], notice: 'Your request for a ride has been submitted. Good luck!' }
       	format.json { render json: [current_user, @ride], status: :created, location: [current_user, @ride] }
			else
				format.html { render action: "new" }
				format.json { render json: @ride.errors, status: :unprocessable_entity }
			end
		end

	end

	# PUT /users/:id/rides/1
	# PUT /users/:idrides/1.json
	def update
		@ride = current_user.rides.find(params[:id])

		respond_to do |format|
			if @ride.update_attributes(params[:ride])
				format.html { redirect_to [current_user, @ride], notice: 'Ride was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @ride.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@ride = current_user.rides.find(params[:id])
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
