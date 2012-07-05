# --------------------------------
# Entry step definitions
# --------------------------------


Given /^I am on the homepage$/ do
  visit root_path
end

When /^I press the add entry button$/ do
  click_link 'add_entry_btn'
end

When /^I fill the form with the following data:$/ do |table|
  # table is a Cucumber::Ast::Table
  data 	= table.hashes[0]
  title = data["title"]
  body	= data["body"]
  fill_in("entry_title", with: title)
  fill_in("entry_body", with: body)
end

When /^I press "([^\"]*)"$/ do |button|
	click_button button
end

Then /^also see details of this new created entry$/ do
  page.should have_selector(".fd-ui-tl-item-title h1", content: "Eurovision 2012")
  page.should have_selector(".fd-ui-item-ct-text", content: "some text about the winner")
end


Then /^I should see the notification "([^\"]*)"$/ do |flashKey|
    page.should have_selector ".#{flashKey}"
end

Then /^also see the message "([^"]*)"$/ do |msg|
  page.should have_content msg
end


Given /^there is an entry titled "([^\"]*)"$/ do |entry_title|
  Factory(:entry, title: entry_title)
end

Then /^I should see the entry titled "([^\"]*)"$/ do |title|
  page.should have_content title 
end


Given /^there is an exsiting entry titled "([^\"]*)"$/ do |title|
  step 'there is an entry titled "#{title}"'
end

When /^I press the edit entry button$/ do
  click_link 'Edit'
end

When /^I press the button to save my updates$/ do
  step 'I press "Save"'
end


Then /^I should be on the entry page titled "([^\"]*)"$/ do |title|
  page.should have_content(title)
end