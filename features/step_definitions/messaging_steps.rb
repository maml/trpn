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

And(/^I am on my ride page that has a message$/) do
	ride = Ride.create(
		request: true,
		title: "Need a ride to St. Louis this weekend",
		description: "Heading down for a family reunion",
		from: "Chicago, IL"
	)

	ride.user = User.last
	ride.save!

	user_that_posted_message = User.create(email: "gnar@gnar.com", password: "p@ssw0rd")
	message = ride.messages.build(message: "I want to go to there.")
	message.user = user_that_posted_message
	message.save!
	
	visit "/users/#{ride.user.id}/rides/#{ride.id}"
end

And(/^I enter a message$/) do
	fill_in "message_message", with: "I want to go to there."
end
