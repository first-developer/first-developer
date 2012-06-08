# --------------------------------
# Feature: Managing entries 
# --------------------------------

Feature: Managing entries 
  As an user
  I want to create some easily


  # --------------------------------
  # Scenarios: 
  # --------------------------------
  
  # [1]
  Scenario: Creating an entry
    Given I am on the homepage
    When I press the add entry button
    And I fill the form with the following data:
      |title           |body|
      |Eurovision 2012 |some text about the winner|
    And I press "create entry"
    Then I should see the notification "Entry has been well created" 
    And also see details of this new created entry


  # [2]
  Scenario: Creating an entry without title and/ or body
    Given I am on the homepage
    When I press the add entry button
    And I press "create entry"
    Then I should see the notification "errors" mentioning that "Entry hasn't been created! Verify that every required fields are filled." 
