Feature: Login
	In order to create rides and message other users 
	A visitor
	Should be able to login to their account 

	Scenario: Forgot password
		Given I am a registered user of the app 
		And I am on the login page and have forgotten my password
		When I press "forgotten password?"
		And I enter an "email" of "user@example.com"
		And I press "Reset Password"
		Then I should see "Email sent with password reset instructions."
