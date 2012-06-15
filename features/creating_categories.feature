
Feature: Creating categories
	In other to assign categories to an entry
  As a user
  I want create some potentiel categories


  # BACKGROUNDS


  # SCENARIOS
  
  # [S1]
  @wip
  Scenario: Creating one category for a new entry
    Given I am on the homepage
    When I press the add entry button
    And I fill the form with the following data:
      |title                          |body|
      |Using Capybara with Cucumber   |some text about the winner|
    And I fill the category input with "Testing"
    And I press "Save"
    Then I should see the notification "Entry has been well created" 
    And I should see the category "Testing" in entry details