require 'test_helper'

class RideTest < ActiveSupport::TestCase
	test "it shows rides nearby" do
		ride = rides(:one)
		assert ride.nearby.includes(rides(:two))
	end

	test "it doesn't save a ride without a description" do
  	ride = rides(:one)
		ride.description = nil
	 	assert !ride.save, 'Saved a ride without a description'
  end

	test "it doesn't save a ride without a from" do
		ride = rides(:one)
		ride.from = nil
		assert !ride.save, 'Saved a ride without a from'
	end
end
