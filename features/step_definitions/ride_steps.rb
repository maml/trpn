Given(/^I am a logged in user of the app$/) do
	email = "user@example.com"
	password = "p@ssw0rd"
	
	User.create(email: email, password: password, password_confirmation: password)

	visit "/users/sign_in"
	fill_in "user_email", with: email
	fill_in "user_password", with: password
	click_button "Sign in"
end

And(/^I am on the create a ride page$/) do
	user_id = User.last.id
	visit "/users/#{user_id}/rides/new"
end

Given(/^I am on the rides page$/) do
	visit "/rides"
end

And(/^I am looking for a ride$/) do
	choose "ride_request_looking"
end

And(/^I am leaving from "(.*?)"$/) do |arg1|
	fill_in :ride_from, with: arg1
end

And(/^I enter a title$/) do
	fill_in "ride_title", with: "Looking for a ride to St. Louis this weekend."
end

And(/^I enter a description$/) do
	fill_in 'ride_description', with: "Heading down for my cousing's wedding. Can pay for gas."
end

When(/^I create a request for a ride$/) do
	click_on 'Create Ride'
end

Then(/^I should not see "(.*?)"$/) do |arg1|
	assert !page.has_content?(arg1)
end

When(/^I am on a users ride page$/) do
	ride = Ride.create(
		request: true,
		title: "Need a ride to St. Louis this weekend",
		description: "Heading down for a family reunion",
		from: "Chicago, IL"
	)

	user = User.create(email: "donny@who_loved_bowling.com", password: "p@ssw0rd")
	ride.user = user
	ride.save!

	visit "/users/#{user.id}/rides/#{ride.id}"
end

And(/^I am on a ride page$/) do
	ride = Ride.create(
		request: true,
		title: "Need a ride to St. Louis this weekend",
		description: "Heading down for a family reunion",
		from: "Chicago, IL"
	)

	ride.user = User.create(email: "donny@who_loved_bowling.com", password: "p@ssw0rd")
	ride.save!

	visit "/rides/#{ride.id}"
end
