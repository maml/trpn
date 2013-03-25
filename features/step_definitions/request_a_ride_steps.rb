Given(/^I just want to go somewhere$/) do
	visit "/rides/new"
end

Given(/^I don't care when or where I go$/) do
	assert true
end

When(/^I create a request for a ride$/) do
	choose 'ride_request_need_a_ride'
	fill_in 'ride_title', with: 'Need ride to any National Park'
	fill_in 'ride_description', with: "Hey there, I'm a 20 year old male looking to get outside and see any national park. I've always dreamed of seeing the most popular ones, especially out west. I have a hard time knowing what I want to do with my life and I believe I'll find my answer by doing this. I'm very down to earth, honest, trusting, somewhat quiet. I can leave almost any day. I only work the 7th thru the 9 or 10th day of each month so it can't run between those dates. I am easy going and can put up with anything. I don't have much money but I could pay for food on the way. Please let me know when and where!"
	fill_in 'Latitude', with: '41.9223'
	fill_in 'Longitude', with: '-87.7555'
	click_on 'Create Ride'
end
