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

Then /^I should see the notification "([^\"]*)"$/ do |arg1|
  page.should have_selector("#notification_area p", content: "Entry has been well created" )
end

Then /^also see details of this new created entry$/ do
  page.should have_selector(".fd-ui-tl-item-title h1", content: "Eurovision 2012")
  page.should have_selector(".fd-ui-item-ct-text", content: "some text about the winner")
end