##
## Givens
##
Given /^(?:I've visited a page|I'm on any page|I am on any page)$/ do
	if @current_user then
		visit root_path + "?auth_token=#{@current_user.authentication_token}"
	else
		visit root_path
	end
end

Given /^I am not signed in$/ do
	@current_user.should be_nil
end

##
## Whens
##
When /^(?:that )I (?:visit|am on|have visited) ?(?:any|a) page$/ do
	if @current_user then
		visit root_path + "?auth_token=#{@current_user.authentication_token}"
	else
		visit root_path
	end
end

##
## Then
##
Then /^I should see a "([^"]*)" tab$/ do |tab_name|
	page.should have_selector("div#tabs ul"), "Expected a div with id tabs and a ul"
	page.find('div#tabs ul').should have_link tab_name#, "Expected a link named #{tab_name}"
end

Then /^the page title should be "([^"]*)"$/ do |title|
	pending "Unfinished test"
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should see (?:an|a) "(.+?)" button$/ do |button_name|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a sign\-in form$/ do
  pending # express the regexp above with the code you wish you had
end
