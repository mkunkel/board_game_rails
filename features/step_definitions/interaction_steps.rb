require 'pry'
And('show me the page') do
  save_and_open_page
end

Given(/^I am on the sign in page$/) do
  visit new_user_session_path
end

When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should be on my profile page$/) do
  current_path.should == user_path(@user)
end

Then(/^I should be on (.*?)'s profile page$/) do |username|
  user = User.where(username: username).first
  current_path.should == user_path(user)
end

When(/^I go to (.*?)'s profile page$/) do |name|
  user = User.where(username: name).first
  visit user_path(user)
end

When(/^I (?:click|follow) "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I press "(.*?)"$/) do |text|
  click_button(text)
end

When(/^I press the first "(.*?)"$/) do |text|
  first(:button, text).click
end

Then(/^I should see(?::)? "(.*)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see(?::)? "([^"]*)"$/) do |text|
  page.should_not have_content(text)
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |content, field|
  fill_in(field, with: content)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, content|
  fill_in(field, with: content)
end

When (/^I upload a file "(.*?)"$/) do |file|
  attach_file('squeek_image', File.join(Rails.root, "/features/support/files/#{file}"))
end

When (/^I upload a file with an invalid extension$/) do
  attach_file(:image_url, '../support/files/cat.txt')
end

Then(/^I should see a "(.*?)" button$/) do |arg1|
  page.should have_button(arg1)
end

Given(/^I'm signed in as "(.*?)"$/) do |arg1|
  steps %(
    Given the following user:
      | username              | #{arg1.split('@').first} |
      | email                 | #{arg1}                  |
    When I go to the homepage
    And I follow "Sign In"
    And I fill in "#{arg1}" for "Email / Username"
    And I fill in "password" for "Password"
    And I press "Sign in"
    )
end

Then(/^"(.*?)" should have a player id$/) do |user_name|
  expect(User.where(username: user_name).first.player_id).not_to be_nil
end

When(/^I uncheck "(.*?)"$/) do |checkbox|
  uncheck checkbox
end

When(/^I check "(.*?)"$/) do |checkbox|
  check checkbox
end

Then(/^"(.*?)" should be checked$/) do |arg1|
  page.should have_checked_field(arg1)
end

Then(/^I select "(.*?)" from "(.*?)"$/) do |value, field|
  select(value, from: field)
end

Then(/^"(.*?)" should be selected$/) do |arg1|
  page.field_labeled("#{arg1}").should be_checked
end

When(/^I choose "(.*?)"$/) do |arg1|
  choose(arg1)
end

Then(/^"(.*?)" should be required$/) do |arg1|
  page.find_field("#{arg1}")['required'].should == 'required'
end

Then(/^the URL should contain "(.*?)"$/) do |arg1|
  expect(URI.parse(current_url).to_s.include?(arg1)).to be_true
end

Then(/^the URL should not contain "(.*?)"$/) do |arg1|
  expect(URI.parse(current_url).to_s.include?(arg1)).not_to be_true
end

Then(/^"(.*?)" should be empty$/) do |arg1|
  page.field_labeled("#{arg1}").value.should be_empty
end

Then(/^Players should contain "(.*?)"$/) do |content|
  page.find_by_id('players').value.should have_content(content)
end
