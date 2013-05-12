require 'test_helper'

class RidesControllerTest < ActionController::TestCase
  setup do
    @ride = rides(:one)
  end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:rides)
	end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ride" do
    assert_difference('Ride.count') do
      post :create, ride: { description: @ride.description, latitude: @ride.latitude, longitude: @ride.longitude, request: @ride.request, title: @ride.title, from: @ride.from, to: @ride.to }
    end

    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should show ride" do
    get :show, id: @ride
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ride
		assert_not_nil assigns(:checked_bool_for_have_a_ride), "@checked_bool_for_have_a_ride has not been assigned"
		assert_not_nil assigns(:checked_bool_for_need_a_ride), "@checked_bool_for_need_a_ride has not been assigned"
    assert_response :success
  end

  test "should update ride" do
    put :update, id: @ride, ride: { description: @ride.description, latitude: @ride.latitude, longitude: @ride.longitude, request: @ride.request, title: @ride.title }
    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should destroy ride" do
    assert_difference('Ride.count', -1) do
      delete :destroy, id: @ride
    end

    assert_redirected_to rides_path
  end
end
