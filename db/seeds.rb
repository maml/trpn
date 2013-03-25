# Delete existing data
# Create some Users
# Create some Rides
# Associate Rides with Users

User.delete_all
Ride.delete_all

@bstolte   = User.create({ email: 'bstolte@example.com', password: 'p@ssw0rd', password_confirmation: 'p@ssw0rd' })
@keithnorm = User.create({ email: 'keithnorm@example.com', password: 'p@ssw0rd', password_confirmation: 'p@ssw0rd' })
@mloseke   = User.create({ email: 'mloseke@example.com', password: 'p@ssw0rd', password_confirmation: 'p@ssw0rd' })

@bstolte_rides = Ride.create([
				{ request: 'need_a_ride',
					title: 'SF to LBC sometime next week',
					description: "Going surfing with my friend. Willing to split gas money.",
					latitude: '37.757959',
					longitude: '-122.431641'
				},
				{ request: 'have_a_ride',
					title: 'Portland to SF tomorrow',
					description: "Heading back from my aunt's house. You have to buy me lunch and dinner.",
					latitude: '37.761725',
					longitude: '-122.419710'
				},
				{ request: 'have_a_ride',
					title: 'Ride Offered to Portland 03-25-2013 Early AM',
					description: "I am offering a ride from Berkeley (SF Bay Area) to Portland OR, early AM on 03-25-2013. Luggage is welcome, door-to-door. No smokers, dopers, dogs, pets, or bicycles. If you are interested in a ride, please email me your telephone number and physical street address, so that I know how to find you. If this ad is still up, that means there is room in the car, and that I haven't left yet. Asking $62/person, or $60 if you are able to be dropped off on my route.",
					latitude: '37.755312',
					longitude: '-122.420654'
				}])

@keithnorm_rides = Ride.create([
				{ request: 'need_a_ride',
					title: 'SF to LA tomorrow',
					description: "Want to hunt down an horchata latte. Willing to split gas money.",
					latitude: '37.390891',
					longitude: '-122.082653'
				},
				{ request: 'need_a_ride',
					title: 'RIDE NEEDED TO PORTLAND/SEATTLE 3/30 or 4/1',
					description: "Hey! A friend and i desperately need to get back to the nw, specifically olympia wa, but anywhere close works. We have $100 between the two of us but can maybe conjure up more. Email or call 828777two719 if you can help us out!",
					latitude: '37.432205',
					longitude: '-122.083683'
				},
				{ request: 'need_a_ride',
					title: 'Looking for a ride to LA 3/27',
					description: "Looking for a ride down to LA, on wednesday. Im a student, Headed down for a long weekend. I have one small bag and a bass guitar. Im a Very chill, and easy going guy. Let me know if your headed down and looking for a rider. I got cash in hand, gimme a call / 510 910 8927",
					latitude: '37.455919',
					longitude: '-122.179298'
				}])

@mloseke_rides = Ride.create([
				{ request: 'need_a_ride',
					title: 'CHI to SF this Friday',
					description: "I'm going out to work on TRPN with Keith and Brian",
					latitude: '41.908154',
					longitude: '-87.700424'
				},
				{ request: 'need_a_ride',
					title: 'Chicago to NYC anytime after April 2nd',
					description: "I have a backpack and a soft case guitar. I can chip in to split gas, of course. Thanks!",
					latitude: '41.922684',
					longitude: '-87.697334'
				},
				{ request: 'need_a_ride',
					title: 'Chicago to Fairfield Iaowa',
					description: "Hey yall! need a ride from chicago to Fairfield or somewhere close on (3/26) (mt pleasant, ottomwa, iowa city etc) Gas money, food and laughs provided by me! thanks!",
					latitude: '41.915819',
					longitude: '-87.701240'
				}])

@bstolte.rides = @bstolte_rides
@keithnorm.rides = @keithnorm_rides
@mloseke.rides = @mloseke_rides
