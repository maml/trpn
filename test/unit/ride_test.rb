require 'test_helper'

class RideTest < ActiveSupport::TestCase
  test "it doesn't save a ride without a title" do
  	ride = rides(:one)
		ride.title = nil
	 	assert !ride.save, 'Saved a ride without a title'
  end
end
