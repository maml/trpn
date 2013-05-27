# Delete existing data
# Create some Users
# Create some Rides
# Associate Rides with Users

User.delete_all
Ride.delete_all

@bstolte   = User.create({ email: 'bstolte@example.com', password: 'p@ssw0rd', password_confirmation: 'p@ssw0rd' })
@keithnorm = User.create({ email: 'keithnorm@example.com', password: 'p@ssw0rd', password_confirmation: 'p@ssw0rd' })
@mloseke   = User.create({ email: 'mloseke@example.com', password: 'p@ssw0rd', password_confirmation: 'p@ssw0rd' })

# day abbreviations
# Wed, Thu, Fri, Sat, Sun, Mon, Tue

@bstolte_rides = Ride.create([
				{ request: 'need_a_ride',
					description: 'Going surfing with my friend. Willing to split gas money.',
					from: 'San Francisco, CA',
					to: 'Long Beach, CA',
					date: 'Wed, 29 May 2013'
				},
				{ request: 'have_a_ride',
					description: "Heading back from my aunt's house. You have to buy me lunch and dinner.",
					from: 'Portland, OR',
					to: 'San Francisco, CA',
					date: 'Thu, 30 May 2013'
				},
				{ request: 'have_a_ride',
					description: "I am offering a ride from Berkeley (SF Bay Area) to Portland OR, early AM on 03-25-2013. Luggage is welcome, door-to-door. No smokers, dopers, dogs, pets, or bicycles. If you are interested in a ride, please email me your telephone number and physical street address, so that I know how to find you. If this ad is still up, that means there is room in the car, and that I haven't left yet. Asking $62/person, or $60 if you are able to be dropped off on my route.",
					from: 'San Francisco, CA',
					to: 'Portland, OR',
					date: 'Fri, 31 May 2013'
				}])

@keithnorm_rides = Ride.create([
				{ request: 'need_a_ride',
					description: 'Want to hunt down an horchata latte. Willing to split gas money.',
					from: 'San Francisco, CA',
					to: 'Los Angeles, CA',
					date: 'Sat, 1 June 2013'
				},
				{ request: 'need_a_ride',
					description: 'Hey! A friend and i desperately need to get back to the nw, specifically olympia wa, but anywhere close works. We have $100 between the two of us but can maybe conjure up more. Email or call 828777two719 if you can help us out!',
					from: 'San Francisco, CA',
					to: 'Portland, OR',
					date: 'Sun, 2 June 2013'
				},
				{ request: 'need_a_ride',
					description: 'Looking for a ride down to LA, on wednesday. Im a student, Headed down for a long weekend. I have one small bag and a bass guitar. Im a Very chill, and easy going guy. Let me know if your headed down and looking for a rider. I got cash in hand, gimme a call / 510 910 8927',
					from: 'San Francisco, CA',
					to: 'Los Angeles, CA',
					date: 'Mon, 3 June 2013'
				}])

@mloseke_rides = Ride.create([
				{ request: 'need_a_ride',
					description: "I'm going out to work on TRPN with Keith and Brian",
					from: 'Chicago, IL',
					to: 'San Francisco, CA',
					date: 'Tue, 4 June 2013'
				},
				{ request: 'need_a_ride',
					description: 'I have a backpack and a soft case guitar. I can chip in to split gas, of course. Thanks!',
					from: 'Chicago, IL',
					to: 'New York, NY',
					date: 'Wed, 5 June 2013'
				},
				{ request: 'need_a_ride',
					description: 'Hey yall! need a ride from chicago to Fairfield or somewhere close on (3/26) (mt pleasant, ottomwa, iowa city etc) Gas money, food and laughs provided by me! thanks!',
					from: 'Chicago, IL',
					to: 'Fairfield, IA',
					date: 'Thu, 6 June 2013'
				}])

@bstolte.rides = @bstolte_rides
@keithnorm.rides = @keithnorm_rides
@mloseke.rides = @mloseke_rides
