Given(/^I am a user of the app$/) do
	User.create(email: 'user@example.com', password: 'p@ssw0rd', password_confirmation: 'p@ssw0rd')
end

And(/^I am on the create a ride page$/) do
	user_id = User.first.id
	visit "/users/#{user_id}/rides/new"
end

And(/^I am looking for a ride$/) do
	choose "ride_request_need_a_ride"
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
	# deprecate / delete title
	# fill_in 'ride_title', with: 'Need ride to any National Park'
	# lat / long should just be geocoded in the background, will be stored in db but not initially exposed on UI(s)
	# fill_in 'Latitude', with: '41.9223'
	# fill_in 'Longitude', with: '-87.7555'
	click_on 'Create Ride'
end
