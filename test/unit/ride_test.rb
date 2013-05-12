require 'test_helper'

class RideTest < ActiveSupport::TestCase
	test "it shows rides nearby" do
		ride = rides(:one)
		ride.geocode
		assert ride.nearby.includes(rides(:nearby_one))
	end

	test "it doesn't save a ride without a description" do
  	ride = rides(:one)
		ride.description = nil
	 	assert !ride.save, 'Saved a ride without a description'
  end
end
