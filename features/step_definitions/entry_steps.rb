# --------------------------------
# Entry step definitions
# --------------------------------

Given /^I am on the homepage$/ do
  visit(root_url)
end

When /^I follow "([^\"]*)"$/ do |link|
	click_on link
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

Then /^I should see the notification "([^\"]*)"$/ do |arg1|
  page.should have_content("Entry has been well created")
end

Then /^also see details of this new created entry$/ do
  pending # express the regexp above with the code you wish you had
end