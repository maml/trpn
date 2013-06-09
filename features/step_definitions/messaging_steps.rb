Given(/^I am on a ride page$/) do
	ride = Ride.create(
		description: "Need to get to St. Louis for a family reunion",
		from: "Chicago, IL",
		to: "St. Louis, MO"
	)

	user = User.create({ email: "foo@example.com", password: "p@ssw0rd" }) 

	ride.user_id = user.id
	ride.save

	visit "/rides/#{ride.id}"
end

And(/^I enter a message$/) do
	fill_in "message_message", with: "I want to go to there."
end
