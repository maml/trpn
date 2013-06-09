require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "it sets username to everything before the email's '@' character" do
		user = users(:one)
		assert_equal(user.username, user.email.split("@")[0], "Expected username to be #{user.email.split("@")[0]} but got #{user.username} instead")
	end
end
