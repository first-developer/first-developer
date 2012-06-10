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

  # [3]
  Scenario: Listing all projects 
    Given there is an entry titled "iOS 6"
    And I am on the homepage
    Then I should see the entry titled "iOS 6"

  # [4]
  Scenario: Editing an existing entry from the homepage
    Given there is an exsiting entry titled "iOS 6"
    And I am on the homepage
    When I press the edit entry button
    And I fill the form with the following data:
      |title                   |body|
      |iOS 6 the new Apple OS  |All this for Apple users|
    And I press the button to save my updates
    Then I should be notice by "Entry was nicely updated."
    Then I should be on the entry page titled "iOS 6 the new Apple OS"

