require 'test_helper'

class Users::Rides::MessagesControllerTest < ActionController::TestCase

	setup do
		@ride = rides(:one)
		@user = login_user
  end

	test "should get new" do
		get :new, ride_id: @ride.id, user_id: @user.id
		assert_not_nil assigns(:message)
		assert_not_nil assigns(:ride)
	end

	test "should create message" do
		assert_difference("Message.count") do
			post :create, message: { message: "I want to take this ride." }, ride_id: @ride.id, user_id: @user.id
		end

		assert_redirected_to user_ride_path(@ride.user, @ride)
	end
end
