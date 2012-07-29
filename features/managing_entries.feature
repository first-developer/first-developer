
Feature: Manage entries
 
As an user
I want to create some easily



# [1]
Scenario: Creating an entry
	Given I am on the homepage
	When  I press the add entry button
	And   I fill the form with the following data:
	        |title            |body |
	        |Eurovision 2012  |some text about the winner |
	And   I press "Save"
	Then  I should see the notification "notice"
	And   also see the message "Entry has been well created" 
	And   also see details of this new created entry
	
	
# [2]
Scenario: Creating an entry without title and/ or body
	Given I am on the homepage
	When  I press the add entry button
	And   I press "Save"
	Then  I should see the notification "errors"
	And   also see the message "Entry hasn't been created! Verify that every required fields are filled." 


# [3]
Scenario: Listing all projects 
	Given there is an entry titled "iOS 6"
	And   I am on the homepage
	Then  I should see the entry titled "iOS 6"
	
	
# [4]
Scenario: Editing an existing entry from the homepage
	Given there is an exsiting entry titled "iOS 6"
	And   I am on the homepage
	When  I press the edit entry button
	And   I fill the form with the following data:
	        |title                    |body |
	        |iOS 6 the new Apple OS   |All this for Apple users |
	And   I press the button to save my updates
	Then  I should see the notification "notice"
	And   also see the message "Entry was nicely updated." 
	And   I should be on the entry page titled "iOS 6 the new Apple OS"

Scenario: Assigning a type to a specfic entry 
  Given I have the following entry:
    |title                        |body |
    |The winner of the Eurovision |Loreen from Sweeden won the eurovision with|
  And   I have the following entry types:
    |id  |name         | 
    |1   |post         | 
    |2   |music        | 
    |3   |video        | 
  When  I follow "The winner of the Eurovision"'s edit page
  And   I choose the "music" type for the entry 
  And   I press "Save"
  Then  I should see the "music" icon as this entry type indicator 

@wip 
Scenario: Hide the read more button for short entries
  Given I have an entry titled "Nike short"
  And   the following entry body:
    """
    Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam quis risus eget urna mollis ornare vel eu leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    """
  When  I go to the homepage
  Then  I should not see the read more button for this entry


Scenario: Show the read more button for full entries
  Given I have an entry titled "Nike"
  And   the following entry body:
    """
    Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nullam quis risus eget urna mollis ornare vel eu leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    Cras mattis consectetur purus sit amet fermentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed odio dui. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec sed odio dui. Donec sed odio dui. Maecenas sed diam eget risus varius blandit sit amet non magna.
    """
  When  I go to the homepage
  Then  I should see the read more button for this entry

