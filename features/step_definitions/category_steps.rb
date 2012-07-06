When /^I fill the category input with "([^\"]*)"$/ do |category|
  fill_in 	"entry_category_tokens", with: category 
end

Then /^also the message "([^\"]*)"$/ do |msg|
   page.should have_selector 	"#notification_area p", content: msg
end

Then /^I should see the category '([^"]*)' in entry details$/ do |category|
  find(".fd-ui-tl-item .fd-ui-tl-item-title").find(".details").should have_content category
end