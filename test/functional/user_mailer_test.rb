require "test_helper"

class UserMailerTest < ActionMailer::TestCase
	def test_launch_welcome_email
		user = users(:one)

		# Send the email, then test that it got queued
		email = UserMailer.launch_welcome_email(user).deliver
		assert !ActionMailer::Base.deliveries.empty?
	end
end
