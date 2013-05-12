require 'test_helper'

class RideTest < ActiveSupport::TestCase
	test "it shows rides nearby" do
		ride = rides(:one)
		assert ride.nearby.includes(rides(:two))
	end
end
