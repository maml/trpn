Feature: Request a ride 
	In order to let riders connect with drivers
	As a user of the app
	I want to be able to request a ride from the community

	Scenario: I'm looking for a ride from Chicago to St. Louis on a specific date.
		Given I am a user of the app
		And I am on the create a ride page
		And I am looking for a ride
		And I want to go from "Chicago" to "St. Louis"
		And I want to go on "2013" "July" "1"
		And I enter a description
		When I create a request for a ride
		Then I should see "Your request for a ride has been submitted. Good luck!"

