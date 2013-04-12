require 'test_helper'

class RidesControllerTest < ActionController::TestCase
  setup do
    @ride = rides(:one)
		@user = users(:one)
		@user.rides = [@ride]
  end

	test "should get all rides" do
		get :all
		assert_response :success
		assert_not_nil assigns(:rides)
	end

  test "should get index" do
    get :index, user_id: @user.id
    assert_response :success
    assert_not_nil assigns(:rides)
  end

  test "should get new" do
    get :new, user_id: @user.id
    assert_response :success
  end

  test "should create ride" do
    assert_difference('Ride.count') do
      post :create, ride: { description: @ride.description, latitude: @ride.latitude, longitude: @ride.longitude, request: @ride.request, title: @ride.title }, user_id: @user.id
    end

    assert_redirected_to user_ride_path(@user.id, assigns(:ride))
  end

  test "should show ride" do
    get :show, id: @ride, user_id: @user.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ride, user_id: @user.id
		assert_not_nil assigns(:checked_bool_for_have_a_ride), "@checked_bool_for_have_a_ride has not been assigned"
		assert_not_nil assigns(:checked_bool_for_need_a_ride), "@checked_bool_for_need_a_ride has not been assigned"
    assert_response :success
  end

  test "should update ride" do
    put :update, id: @ride, ride: { description: @ride.description, latitude: @ride.latitude, longitude: @ride.longitude, request: @ride.request, title: @ride.title }, user_id: @user.id
    assert_redirected_to user_ride_path(@user.id, assigns(:ride))
  end

  test "should destroy ride" do
    assert_difference('Ride.count', -1) do
      delete :destroy, id: @ride, user_id: @user.id
    end

    assert_redirected_to user_rides_path
  end
end
