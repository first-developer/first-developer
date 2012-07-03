When /^I fill the category input with "([^\"]*)"$/ do |category|
  fill_in("entry_categories", with: category)
end

Then /^I should see the category "([^\"]*)" in entry details$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end