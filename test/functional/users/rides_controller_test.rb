require 'test_helper'

class Users::RidesControllerTest < ActionController::TestCase

	setup do
		@ride = rides(:one)
		@user = login_user
		@user.rides = [@ride]
	end

	test "should get index" do
		get :index, user_id: @user.id
		assert_response :success
		assert_not_nil assigns(:rides)
	end

	test "should get new" do
		login_user
		get :new, user_id: @user.id
		assert_response :success
	end

	test "new should redirect to index if the logged in user is on someone else's new route" do
		# login_user returns the logged in user, which is hardcoded to users(:one)
		user1 = users(:one)
		get :new, user_id: user1.id
		assert_redirected_to user_rides_path(user1)	
	end

	test "should create ride" do
		assert_difference('Ride.count') do
			post :create, ride: { title: @ride.title, description: @ride.description, request: @ride.request, from: @ride.from }, user_id: @user.id
		end

		assert_redirected_to user_ride_path(@user.id, assigns(:ride))
	end

	test "should show ride" do
		get :show, id: @ride, user_id: @user.id
		assert_response :success
		assert_not_nil assigns(:ride)
	end

	test "should get edit" do
		get :edit, id: @ride, user_id: @user.id
		assert_response :success
	end

	test "should update ride" do
		put :update, id: @ride, ride: { description: @ride.description, request: @ride.request }, user_id: @user.id
	 	assert_redirected_to user_ride_path(@user.id, assigns(:ride))	
	end

	test "should destroy ride" do
		assert_difference('Ride.count', -1) do
			delete :destroy, id: @ride, user_id: @user.id
		end

		assert_redirected_to user_rides_path
	end
	
end
