

# ---------------------------------------------------------------------------------------------
# Scenario: Creating an entry / Creating an entry without title and/ or body
# ---------------------------------------------------------------------------------------------

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

Then /^I should see the notification "([^\"]*)"$/ do |flashKey|
    page.should have_selector ".#{flashKey}"
end

Then /^also see the message "([^\"]*)"$/ do |msg|
  page.should have_content msg
end

Then /^also see details of this new created entry$/ do
  page.should have_selector(".fd-ui-tl-item-title h1", content: "Eurovision 2012")
  page.should have_selector(".fd-ui-item-ct-text", content: "some text about the winner")
end



# ---------------------------------------------------------------------------------------------
# Scenario: Listing all projects 
# ---------------------------------------------------------------------------------------------

Given /^there is an entry titled "([^\"]*)"$/ do |entry_title|
  Factory(:entry, title: entry_title)
end

Then /^I should see the entry titled "([^\"]*)"$/ do |title|
  page.should have_content title 
end



# ---------------------------------------------------------------------------------------------
# Scenario: Editing an existing entry from the homepage
# ---------------------------------------------------------------------------------------------

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


Given /^I have the following entry:$/ do |table|
  data 	= table.hashes[0]
  title = data["title"]
  body	= data["body"]
  @entry 	= Factory.create :entry, title: title
  @entry.nil?.should == false
end

When /^I follow "(.*?)"'s edit page$/ do |link_title|
  visit edit_entry_path(@entry)
end

Given /^I have the following entry types:$/ do |table|
  @types  = []
  table.hashes.each do |item|
    @types << Factory.create(:type, id: item["id"], name: item["name"])  
  end
  @types.count.should == table.hashes.size
end

When /^I choose the "(.*?)" type for the entry$/ do |typeName|
  type_id  = @types.select { |type| type.name == typeName }
  type_id  = type_id.first.id
  radio_id = ["entry", "type_id", type_id].join("_") 
  choose(radio_id)
end

Then /^I should see the "(.*?)" icon as this entry type indicator$/ do |typeName|
  page.has_selector?("span.#{typeName}").should be_true
end

# ==================================================================

Given /^I have an entry titled "(.*?)"$/ do |title|
  @entry = Factory.create(:entry, title: title)
  @entry.blank?.should_not be_true
end

Given /^the following entry body:$/ do |text|
  @entry.body = text
  @entry.save
  @entry.body.blank?.should_not be_true
end

Then /^I should see the read more button for this entry$/ do 
  within("#entry-#{@entry.id}") do 
    page.has_selector?(".continue-reading").should be_true
  end 
end

Then /^I should not see the read more button for this entry$/ do
  within("#entry-#{@entry.id}") do 
    page.has_selector?(".continue-reading").should be_false
  end 
end

