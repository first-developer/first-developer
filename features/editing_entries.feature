
Feature: Editing entries 
  In other to update entry information 
  As an user
  I want to be able to do that via an interface



  # SCENARIOS
  
  # [S1]
  Scenario: Listing all projects 
    Given there is an entry titled "iOS 6"
    And I am on the homepage
    Then I should see the entry titled "iOS 6"

  # [S2]
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

 
