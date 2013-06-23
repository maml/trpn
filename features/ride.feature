Feature: Ride 
	In order to let others know about my rides 
	As a user of the app
	I want to be able to post rides

	Scenario: I'm logged in and I'm looking for a ride from Chicago 
		Given I am a logged in user of the app
		And I am on the create a ride page
		And I am looking for a ride
		And I am leaving from "Chicago"
		And I enter a title
		And I enter a description
		When I create a request for a ride
		Then I should see "Your request for a ride has been submitted. Good luck!"

	Scenario: I'm not logged in and attempt to create a ride
		Given I am on the rides page
		When I press "Create a new ride"
		Then I should see "You need to sign in or sign up before continuing."

	Scenario: I'm not logged in, viewing a ride, and shouldn't be able to edit that ride
		Given I am on a ride page
		Then I should not see "Edit"

	Scenario: I'm not logged in, viewing a user's ride, and shouldn't be able to edit that ride
		When I am on a users ride page
		Then I should not see "Edit"
	
	Scenario: I'm not logged in, viewing a ride, and shouldn't be able to delete that ride
		Given I am on a ride page
		Then I should not see "Delete"
	
	Scenario: I'm not logged in, viewing a user's ride, and shouldn't be able to delete that ride
		Given I am on a users ride page
		Then I should not see "Delete"
