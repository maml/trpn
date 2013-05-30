require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it does not create a user without an email address' do
		user = User.new
    assert !user.save, 'Created a user without an email address' 
  end

	test 'it does not create a user without a password' do
		user = users(:one)
		user.password = nil
		assert !user.save, 'Created a user without a password'
	end

	test 'it does not create a user without confirming the password' do
		user = users(:one)
		assert !user.save, 'Created a user without confirming the password'
	end

	test 'it does not create a user without a password less than 6 characters' do
		user = User.new(email: 'foo@example.com', password: 'p@ss', password_confirmation: 'p@ss')
		assert !user.save, 'Created a user without too short of a password'
	end

	test 'it does not create a user without a password longer than 20 characters' do
		user = User.new(
			email: 'foo@example.com',
			password: 'dkri485gn#$kriur28rfgelkjgoier88998lkj',
			password_confirmation: 'dkri485gn#$kriur28rfgelkjgoier88998lkj'
		)
		assert !user.save, 'Created a user with too long of a password'
	end

	test "it sets username to everything before the email's '@' character" do
		user = users(:one)
		assert_equal(user.username, user.email.split("@")[0], "Expected username to be #{user.email.split("@")[0]} but got #{user.username} instead")
	end
end
