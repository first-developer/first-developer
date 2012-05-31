Feature: Managing entries 
  As an user
  I want to create some easily

  
  Scenario: Creating an entry
    Given I am on the homepage
    When I follow "add entry"
    And I fill the form with the following data:
    	|title           |body|
    	|Eurovision 2012 |some text about the winner|
    And I press "create entry"
    Then I should see the notification "Entry has been well created" 
    And also see details of this new created entry