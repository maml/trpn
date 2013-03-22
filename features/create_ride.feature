Feature: create_ride
  In order to find a rider
  A visitor
  Should be able to create the trip they want to take 

    Scenario: Success
      Given I am on the create ride page
      And I fill in "origin" with "San Francisco, CA"
      And I fill in "destination" with "San Jose, CA"
      And I fill in "start_date" with "Mar 21, 2013"
      And I fill in "arrive_date" with "Mar 21, 2013"
      And I fill in "seats_available" with "2"
      And I fill in "donation_request" with "$10.00"
      And I fill in "trip_description" with "I'm driving to San Jose.  Sit shotgun and enjoy the ride!"
      When I press "Submit"
      Then I should see "Your trip has been created."
    
    Scenario: Failure - unable to geocode origin
      Given I am on the create ride page
      And I fill in "origin" with "blah"
      And I fill in "destination" with "San Jose, CA"
      And I fill in "start_date" with "Mar 21, 2013"
      And I fill in "arrive_date" with "Mar 21, 2013"
      And I fill in "seats_available" with "2"
      And I fill in "donation_request" with "$10.00"
      And I fill in "trip_description" with "I'm driving to San Jose.  Sit shotgun and enjoy the ride!"
      When I press "Submit"
      Then I should see "We were unable to map your starting location."
    
    Scenario: Failure - unable to geocode destination
      Given I am on the create ride page
      And I fill in "origin" with "San Francisco, CA"
      And I fill in "destination" with "blah"
      And I fill in "start_date" with "Mar 21, 2013"
      And I fill in "arrive_date" with "Mar 21, 2013"
      And I fill in "seats_available" with "2"
      And I fill in "donation_request" with "$10.00"
      And I fill in "trip_description" with "I'm driving to San Jose.  Sit shotgun and enjoy the ride!"
      When I press "Submit"
      Then I should see "We were unable to map your destination."
      
    Scenario: Failure - start date is not formatted correctly
      Given I am on the create ride page
      And I fill in "origin" with "San Francisco, CA"
      And I fill in "destination" with "San Jose, CA"
      And I fill in "start_date" with "blah"
      And I fill in "arrive_date" with "Mar 21, 2013"
      And I fill in "seats_available" with "2"
      And I fill in "donation_request" with "$10.00"
      And I fill in "trip_description" with "I'm driving to San Jose.  Sit shotgun and enjoy the ride!"
      When I press "Submit"
      Then I should see "Your start date appears to be formatted incorrectly."
      
    Scenario: Failure - arrive date is not formatted correctly
      Given I am on the create ride page
      And I fill in "origin" with "San Francisco, CA"
      And I fill in "destination" with "San Jose, CA"
      And I fill in "start_date" with "Mar 21, 2013"
      And I fill in "arrive_date" with "blah"
      And I fill in "seats_available" with "2"
      And I fill in "donation_request" with "$10.00"
      And I fill in "trip_description" with "I'm driving to San Jose.  Sit shotgun and enjoy the ride!"
      When I press "Submit"
      Then I should see "Your arrive date appears to be formatted incorrectly."
      
    Scenario: Failure - seats is not formatted correctly
      Given I am on the create ride page
      And I fill in "origin" with "San Francisco, CA"
      And I fill in "destination" with "San Jose, CA"
      And I fill in "start_date" with "Mar 21, 2013"
      And I fill in "arrive_date" with "Mar 21, 2013"
      And I fill in "seats_available" with "blah"
      And I fill in "donation_request" with "$10.00"
      And I fill in "trip_description" with "I'm driving to San Jose.  Sit shotgun and enjoy the ride!"
      When I press "Submit"
      Then I should see "The number of seats appears to be formatted incorrectly."
      
    Scenario: Failure - donation request is not formatted correctly
      Given I am on the create ride page
      And I fill in "origin" with "San Francisco, CA"
      And I fill in "destination" with "San Jose, CA"
      And I fill in "start_date" with "Mar 21, 2013"
      And I fill in "arrive_date" with "Mar 21, 2013"
      And I fill in "seats_available" with "2"
      And I fill in "donation_request" with "blah"
      And I fill in "trip_description" with "I'm driving to San Jose.  Sit shotgun and enjoy the ride!"
      When I press "Submit"
      Then I should see "Please enter a dollar amount for the rider donation."
      
    Scenario: Failure - trip description is empty
      Given I am on the create ride page
      And I fill in "origin" with "San Francisco, CA"
      And I fill in "destination" with "San Jose, CA"
      And I fill in "start_date" with "Mar 21, 2013"
      And I fill in "arrive_date" with "Mar 21, 2013"
      And I fill in "seats_available" with "2"
      And I fill in "donation_request" with "blah"
      And I fill in "trip_description" with "I'm driving to San Jose.  Sit shotgun and enjoy the ride!"
      When I press "Submit"
      Then I should see "Please describe your trip to help riders better understand what you're looking for in a rider."