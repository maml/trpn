Given(/^I am on the signup page$/) do
	visit new_user_registration_path
end

When(/^I log out$/) do
	visit destroy_user_session_path
end
