require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it does not create a user without an email address' do
		user = User.new
    assert !user.save, 'Created a User without an email address' 
  end

	test 'it does not create a user without a password' do
		user = users(:one)
		user.password = nil
		assert !user.save, 'Created a User without a password'
	end

	test 'it does not create a user without confirming the password' do
		user = users(:one)
		assert !user.save, 'Created a User without confirming the password'
	end
end
