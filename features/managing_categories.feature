
Feature: managing categories

In other to assign categories to an entry
As a user
I want to be able to manage entry's categories



Scenario: Creating one category for a new entry
	Given I am on the homepage
	When  I press the add entry button
 	And   I fill the form with the following data:
	        |title                           |body |
	        |Using Capybara with Cucumber    |some text about the winner |
	And   I fill the category input with "Testing"
	And   I press "Save"
	Then  I should see the notification "notice"
	And   also the message "Entry has been well created" 
	And   I should see the category 'Testing' in entry details

@wip
Scenario: See preload categories when editing an entry
	Given I have an article titled "Managing rails 3" with "Rails" as category
	When  I go to its edit page
	Then  I should be in the edit page of this article
	And   I should see "Rails" in the category field of the form
