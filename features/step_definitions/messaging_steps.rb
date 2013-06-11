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

And(/^I enter a message$/) do
	fill_in "message_message", with: "I want to go to there."
end
