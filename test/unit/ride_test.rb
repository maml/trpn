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

	test "it doesn't save a ride without a title" do
		ride = rides(:one)
		ride.title = nil
		assert !ride.save, 'Saved a ride without a title'
	end

	test "it doesn't save a ride without a user" do
		ride = rides(:one)
		ride.user = nil
		assert !ride.save, "Saved a ride without a user"
	end

	test "it does not attempt to geocode a `to` location if one is not present" do
		ride = rides(:one)
		assert_nil ride.to_latitude, "Expected the ride's to_latitude to be nil but received: #{ride.to_latitude} instead."
		assert_nil ride.to_longitude, "Expected the ride's to_longitude to be nil but received: #{ride.to_longitude} instead."
	end

	test "it geocodes a `to` location if present" do
		ride = rides(:one)
		ride.to = "Chicago, IL"
		ride.save
		assert_not_nil ride.to_latitude, "Expected ride's to_latitude not to be nil, but it was."
		assert_not_nil ride.to_longitude, "Expected ride's to_longitude not to be nil, but it was."
	end
end
