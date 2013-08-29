Given(/^I am a registered user of the app$/) do
	User.create(email: "user@example.com", password: "p@ssw0rd")
end

Given(/^I log in with "(.*?)" and "(.*?)"$/) do |arg1, arg2|
	visit "/login"
	fill_in "email", with: arg1
	fill_in "password", with: arg2
	click_on "Log In"
end

Given(/^I am on the login page and have forgotten my password$/) do
	visit "/login"
end

And(/^I enter an "(.*?)" of "(.*?)"$/) do |arg1, arg2|
	fill_in arg1, with: arg2
end
