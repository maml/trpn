Feature: profile
  In order to use the product
  A visitor
  Should be able to create a profile

  Scenerio: Success
    Given I am on the create profile page
    And I fill in "name" with "Brian Stolte"  # should we split first and last name?
    And I fill in "photo" with an image # not sure how to do this one?
    And I fill in "location" with "San Francisco, CA"  # what about ZIP codes?  we should accept either/both
    And I fill in "vehicle_make" with "Honda Accord"  # we could structure this with drop-downs instead of free text
    And I fill in "vehicle_year" with "1999"
    And I fill in "about_me" with "An average dude with an average car."
    When I press "Save"
    Then I should see "Profile updated!"
    
  Scenerio: Failure - name contains illegal characters
    Given I am on the create profile page
    And I fill in "name" with "!@#$%^&*()-_+[]\{};'""/.,><"  
    And I fill in "photo" with an image file
    And I fill in "location" with "San Francisco, CA"
    And I fill in "vehicle_make" with "Honda Accord"
    And I fill in "vehicle_year" with "1999"
    And I fill in "about_me" with "An average dude with an average car."
    When I press "Save"
    Then I should see "You must use only letters and numbers for your name."  
    
  Scenerio: Failure - photo is not an image
    Given I am on the create profile page
    And I fill in "name" with "Brian Stolte"  
    And I fill in "photo" with non-image file
    And I fill in "location" with "San Francisco, CA"
    And I fill in "vehicle_make" with "Honda Accord"
    And I fill in "vehicle_year" with "1999"
    And I fill in "about_me" with "An average dude with an average car."
    When I press "Save"
    Then I should see "The file you uploaded doesn't appear to be an image."
  
  Scenerio: Failure - unable to geocode location
    Given I am on the create profile page
    And I fill in "name" with "Brian Stolte"  
    And I fill in "photo" with an image file
    And I fill in "location" with "blah"
    And I fill in "vehicle_make" with "Honda Accord"
    And I fill in "vehicle_year" with "1999"
    And I fill in "about_me" with "An average dude with an average car."
    When I press "Save"
    Then I should see "We were unable to determine your location.  Please provide your city and state or ZIP code."
  
  Scenerio: Failure - vehicle_make contains illegal characters
    Given I am on the create profile page
    And I fill in "name" with "Brian Stolte"  
    And I fill in "photo" with an image file
    And I fill in "location" with "San Francisco, CA"
    And I fill in "vehicle_make" with "!@#$%^&*()-_+[]\{};'""/.,><"
    And I fill in "vehicle_year" with "1999"
    And I fill in "about_me" with "An average dude with an average car."
    When I press "Save"
    Then I should see "You can only use letters and numbers for your vehicle make."
    
  Scenerio: Failure - vehicle_year contains illegal characters
      Given I am on the create profile page
      And I fill in "name" with "Brian Stolte"  
      And I fill in "photo" with an image file
      And I fill in "location" with "San Francisco, CA"
      And I fill in "vehicle_make" with "Honda Accord"
      And I fill in "vehicle_year" with "!@#$%^&*()-_+[]\{};'""/.,>< A-Z"
      And I fill in "about_me" with "An average dude with an average car."
      When I press "Save"
      Then I should see "You can only use numbers for your vehicle year."
  