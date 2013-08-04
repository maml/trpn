require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "it sets name to everything before the email's '@' character" do
		user = users(:one)
		assert_equal(user.name, user.email.split("@")[0], "Expected name to be #{user.email.split("@")[0]} but got #{user.name} instead")
	end
end
