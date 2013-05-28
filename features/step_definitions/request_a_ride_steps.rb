Given(/^I am a user of the app$/) do
	User.create(email: 'user@example.com', password: 'p@ssw0rd', password_confirmation: 'p@ssw0rd')
end

And(/^I am on the create a ride page$/) do
	user_id = User.first.id
	visit "/users/#{user_id}/rides/new"
end

And(/^I am looking for a ride$/) do
	choose "ride_request_looking"
end

And(/^I want to go from "(.*?)" to "(.*?)"$/) do |arg1, arg2|
	fill_in :ride_from, with: arg1
	fill_in :ride_to, with: arg2
end

And(/^I want to go on "(.*?)" "(.*?)" "(.*?)"$/) do |arg1, arg2, arg3|
	select arg1, from: :ride_date_1i
	select arg2, from: :ride_date_2i
	select arg3, from: :ride_date_3i
end

And(/^I enter a description$/) do
	fill_in 'ride_description', with: "Hey there looking to head down to St. Louis for my cousing's wedding."
end

When(/^I create a request for a ride$/) do
	click_on 'Create Ride'
end
