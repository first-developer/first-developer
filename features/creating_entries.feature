
Feature: Creating entries
  In other to express myself 
  As an user
  I want to create some entries easily


  # SCENARIOS
  
  # [S1]
  Scenario: Creating an entry
    Given I am on the homepage
    When I press the add entry button
    And I fill the form with the following data:
      |title           |body|
      |Eurovision 2012 |some text about the winner|
    And I press "Save"
    Then I should see the notification "Entry has been well created" 
    And also see details of this new created entry


  # [S2]
  Scenario: Creating an entry without title and/ or body
    Given I am on the homepage
    When I press the add entry button
    And I press "Save"
    Then I should see the notification "errors" mentioning that "Entry hasn't been created! Verify that every required fields are filled." 
