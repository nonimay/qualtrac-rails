Given(/^there's a member with first name "(.*?)", last name "(.*?)" and membership number '(\d+)'$/) do |first_name, last_name, membership_number|
  @member = Member.create(first_name: first_name, last_name: last_name, membership_number: membership_number)
end

When(/^I am on the members page$/) do
  visit members_path
end

Then(/^I should see "(.*?)" on the page$/) do |member_details|
  page.should have_content(member_details)
end

Given(/^there are several members in the system$/) do
  @members = []
  (1..5).each do |index|
    @members << Member.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, membership_number: index)
  end
end

Then(/^I should see all the members on the page$/) do
  @members.each do |member|
    page.should have_content("#{member.first_name} #{member.last_name} #{member.membership_number}")
  end
end

When (/^I am on the members editing page and change first name to "(.*?)" and last name to "(.*?)"$/) do |first_name, last_name|
  visit edit_member_path @member
  fill_in('First name', :with => first_name)
  fill_in('Last name', :with => last_name)
  click_button('Update Member')
  visit members_path
end


When(/^I am on the members editing page and leave first name blank$/) do
  visit edit_member_path @member
  fill_in('First name', :with => "")
  click_button('Update Member')
end

When(/^I am on the members editing page and leave last name blank$/) do
  visit edit_member_path @member
  fill_in('Last name', :with => "")
  click_button('Update Member')
end

When(/^I am on the members editing page and leave membership number blank$/) do
  visit edit_member_path @member
  fill_in('Membership number', :with => "")
  click_button('Update Member')
end

Then(/^I should see "(.*?)" error message on the page$/) do |error_message|
  page.should have_content(error_message)
end
