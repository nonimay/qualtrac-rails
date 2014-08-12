Given(/^there's a member with first name "(.*?)", last name "(.*?)" and membership number '(\d+)'$/) do |first_name, last_name, membership_number|
  @member = Member.create(first_name: first_name, last_name: last_name, membership_number: membership_number)
end

When(/^I am on the members page$/) do
  visit members_path
end

Then(/^I should see "(.*?)" on the page$/) do |member_details|
  page.should have_content(member_details)
end
