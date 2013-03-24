Feature: Signup
	In order to use the product
	A visitor
	Should be able to create an account

	Scenario: Success
		Given I am on the signup page
		And I fill in "user_email" with "brian.stolte@gmail.com"
		And I fill in "user_name" with "brian stolte"
		And I fill in "password" with "password"
		When I press "Sign up"
		Then I should see "Thanks for signing up!"
	
	Scenario: Failure - email address is already in use
		Given I am on the signup page
		And I fill in "user_email" with "brian.stolte@gmail.com"
		And I fill in "user_name" with "brian stolte"
		And I fill in "password" with "password"
		When I press "Sign up"
		And I fill in "user_email" with "brian.stolte@gmail.com"
		And I fill in "user_name" with "brian stolte"
		And I fill in "password" with "password"
		When I press "Sign up"
		Then I should see "That email address is already in use."
	
	Scenario: Failure - email address is not an email address
		Given I am on the signup page
		And I fill in "user_email" with "brian.stolte@gmail"
		And I fill in "user_name" with "brian stolte"
		And I fill in "password" with "password"
		When I press "Sign up"
		Then I should see "That doesn't look like a valid email address."
	
	Scenario: Failure - password is not long enough
		Given I am on the signup page
		And I fill in "user_email" with "brian.stolte@gmail.com"
		And I fill in "user_name" with "brian stolte"
		And I fill in "password" with "passw"
		When I press "Sign up"
		Then I should see "Your password must be at least 6 characters."
