require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  setup do
    @subscription = subscriptions(:one)
  end

  test "should create subscription" do
    assert_difference('Subscription.count') do
      post :create, :subscription => { :email => 'foo@example.com' }
    end

    assert_redirected_to root_path
  end
end
