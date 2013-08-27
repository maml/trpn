Given(/^I am on the signup page$/) do
	visit signup_path
end

When(/^I log out$/) do
	visit logout_path
end
