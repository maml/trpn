Feature: Signup
	In order to use the product
	A visitor
	Should be able to create an account

	Scenario: Success
		Given I am on the signup page
		And I fill in "user_email" with "brian.stolte@gmail.com"
		And I fill in "user_password" with "p@ssw0rd"
		And I fill in "user_password_confirmation" with "p@ssw0rd"
		When I press "Sign Up"
		Then I should see "Thanks for signing up!"

	Scenario: Failure - email address is already in use
		Given I am on the signup page
		And I fill in "user_email" with "brian.stolte@gmail.com"
		And I fill in "user_password" with "p@ssw0rd"
		And I fill in "user_password_confirmation" with "p@ssw0rd"
		When I press "Sign Up"
		And I log out
		And I am on the signup page
		And I fill in "user_email" with "brian.stolte@gmail.com"
		And I fill in "user_password" with "p@ssw0rd"
		And I fill in "user_password_confirmation" with "p@ssw0rd"
		When I press "Sign Up"
		Then I should see "Email has already been taken"
		
	Scenario: Failure - invalid email address
		Given I am on the signup page
		And I fill in "user_email" with "invalid@gmail"
		And I fill in "user_password" with "p@ssw0rd"
		And I fill in "user_password_confirmation" with "p@ssw0rd"
		When I press "Sign Up"
		Then I should see "Please enter a valid email address"
	
	Scenario: Failure - password is not long enough
		Given I am on the signup page
		And I fill in "user_email" with "brian.stolte@gmail.com"
		And I fill in "user_password" with "p@ss"
		And I fill in "user_password_confirmation" with "p@ss"
		When I press "Sign Up"
		Then I should see "Password is too short (minimum is 8 characters)"
