Feature: Request a ride 
	In order to let others know that I need a ride
	As a user of the app
	I want to be able to request a ride

	Scenario: I'm looking for a ride from Chicago 
		Given I am a logged in user of the app
		And I am on the create a ride page
		And I am looking for a ride
		And I am leaving from "Chicago"
		And I enter a title
		And I enter a description
		When I create a request for a ride
		Then I should see "Your request for a ride has been submitted. Good luck!"

