Feature: Request a ride 
	In order to let riders connect with drivers
	As a user of the app
	I want to be able to request a ride from the community

	Scenario: I have a vague idea of where and when I want to go
		Given I am a user of the app
		And I just want to go somewhere
		And I don't care when or where I go
		When I create a request for a ride
		Then I should see "Your request for a ride has been submitted. Good luck!"

