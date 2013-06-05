class Rides::MessagesController < ApplicationController

	def new
		@message = Message.new
		@ride = Ride.find(params[:ride_id])
	end

	def create
		@ride = Ride.find(params[:ride_id])
		@message = @ride.messages.new(params[:message])

		respond_to do |format|
			if @message.save
				format.html { redirect_to ride_path(@ride), notice: "Your message has been sent!" }
				format.json { render json: @ride, status: :created, location: @ride }
			else
				format.html { render action: "new" }
				format.json { render json: @message.errors, status: :unprocessable_entity }
			end
		end
	end

end
