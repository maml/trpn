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
		login_user
    get :new
    assert_response :success
  end

  test "should create ride" do
		login_user
    assert_difference('Ride.count') do
      post :create, ride: { title: @ride.title, description: @ride.description, request: @ride.request, from: @ride.from }
    end

    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should show ride" do
    get :show, id: @ride
    assert_response :success
		assert_not_nil assigns(:user)
		assert_not_nil assigns(:messages)
  end

  test "should get edit" do
		user = login_user
		@ride.user = user
		@ride.save!
    get :edit, id: @ride
		assert_not_nil assigns(:offering), "@offering has not been assigned"
		assert_not_nil assigns(:looking), "@looking has not been assigned"
    assert_response :success
  end

	test "edit should redirect to show if current user is not the ride's user" do
		login_user
		get :edit, id: @ride
		assert_redirected_to ride_path(@ride)
	end

  test "should update ride" do
		login_user
    put :update, id: @ride, ride: { description: @ride.description, request: @ride.request }
    assert_redirected_to ride_path(assigns(:ride))
  end

  test "should destroy ride" do
		login_user
    assert_difference('Ride.count', -1) do
      delete :destroy, id: @ride
    end

    assert_redirected_to rides_path
  end
end
