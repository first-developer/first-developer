
# Variables
@entry = nil


# ---------------------------------------------------------------------------------------------
# Scenario: Creating one category for a new entry
# ---------------------------------------------------------------------------------------------

When /^I fill the category input with "([^\"]*)"$/ do |category|
  fill_in 	"entry_category_tokens", with: category 
end

Then /^also the message "([^\"]*)"$/ do |msg|
   page.should have_css "#notification_area p", text: msg
end

Then /^I should see the category '([^"]*)' in entry details$/ do |category|
  find(".fd-ui-tl-item .fd-ui-tl-item-title").find(".details").should have_content category
end


# ---------------------------------------------------------------------------------------------
# Scenario: See preload categories when editing an entry
# ---------------------------------------------------------------------------------------------

Given /^I have an article titled "(.*?)" with "(.*?)" as category$/ do 
	|title, category_name|
  # Create factories
  @entry 	= Factory.create :entry, title: title
  category 	= Factory.create :category, name: category_name 

	# Add the category to the entry
	@entry.categories << category

	(category.in? @entry.categories).should == true
end

When /^I go to its edit page$/ do
  visit edit_entry_path(@entry)
end

Then /^I should be in the edit page of this article$/ do
  current_path.should == edit_entry_path(@entry)
end

Then /^I should see "(.*?)" in the category field of the form$/ do |category_name|
  category_field = page.find_field('entry[category_tokens]')
  values 		 =  category_field.value.split(",")
  (category_name.in? values ).should == true
end