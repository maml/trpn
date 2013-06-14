require 'test_helper'

class Users::Rides::MessagesControllerTest < ActionController::TestCase

	setup do
		# @ride.user is users(:one)
		@ride = rides(:one)
		# login_user hardcoded to login users(:two) and returns user
		@user = login_user
  end

	test "should get index" do
		get :index, ride_id: @ride.id, user_id: @ride.user.id
		assert_not_nil assigns(:ride)
		assert_not_nil assigns(:messages)
	end

	test "index should redirect to user ride path if the current user is not the user that created the ride" do
		get :index, ride_id: @ride.id, user_id: @user.id
		assert_redirected_to user_ride_path(@ride.user, @ride)
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
