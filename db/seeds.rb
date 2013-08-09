# Delete existing data
# Create some Users
# Create some Rides
# Associate Rides with Users

User.delete_all
Ride.delete_all
Conversation.destroy_all

@bstolte   = User.create({ email: 'bstolte@example.com', password: 'p@ssw0rd' })
@keithnorm = User.create({ email: 'keithnorm@example.com', password: 'p@ssw0rd' })
@mloseke   = User.create({ email: 'mloseke@example.com', password: 'p@ssw0rd' })

# day abbreviations
# Wed, Thu, Fri, Sat, Sun, Mon, Tue

@bstolte_rides = Ride.create([
				{ request: false,
					title: "Ride offer Chicago to Toronto to Montreal",
					description: "Hey everyone! We are a French couple traveling in our van across the country. We are going east. We are now in Winnipeg and going to Montreal through Chicago and Toronto. We have 2 extra seats and some room for your stuff. If anybody want to join us for a fun roadtrip, let us know!!",
					from: 'Chicago, IL',
				},
				{ request: false,
					title: "ride to bonnoroo!! i drive 6/10",
					description: "I am going to volunteer at bonnoroo, which is in Tennessee. I want to be on my own slack schedule so that is why I will be driving my car, a hatchback Volkswagen rabbit. I am willing to carpool with people who are going there, or give people a ride along the way. I may even visit a friend in ashville, NC. So I would not mind much detouring, especially if you have some interesting sights to show me. Email me for more details or my number",
					from: 'Lemont, IL',
				},
				{ request: true,
					title: "could really use some help (ride) chicago to nj",
					description: "Hello,\n\nI am in a really tough situation and could really use some help from a friend. My former friend ditched me here in galesburge, IL after a disagreement, with no money, no cell phone, no way to contact anyone I know back home, and worst of all, I am 1000 miles away from home and could really use someone. If you are going east and need someone to drive with or could give me a ride that would be great! or if you have a spare bed for the night so I could have enough time to get money from home that would me amazing! Even if you could spare a dollar or a phone call I would forever be indepted to you.\n\nI am a 22 year old college student, and I have no idea what to freaking do..\n\nAny help would be so much appreciated! ( hopefully there is some humanity still left out there)\n\nPlease email me",
					from: "Galesburg, IL",
				}])

@keithnorm_rides = Ride.create([
				{ request: false,
					title: "Ride offered, Chicago -> Portland, OR, 6/10",
					description: "heading out early morning 6/10, 4 day journey. email if interested/looking for details.
looking for a passenger to ride part of or the whole way there. must have a driver's license, be clean, and no sketchy drugs.",
					from: "Chicago, IL",
					date: '10 June 2013'
				},
				{ request: false,
					title: "bonnaroo 2013",
					description: "I am leaving monday or tuesday for bonnaroo in manchester TN, anyone wanna ride and share gas cost let me know. I also have an extra pass if you need one.",
					from: "Chicago, IL",
				},
				{ request: true,
					title: "Need ride To Atlanta! Must be there by 4pm Tuesday",
					description: "I need to go to court in Atlanta and i have to be there by 4pm. I am willing to split gas cost with someone. I dont have a vehicle to drive that far so we would need to drive yours. AA female. Non smoker but i dont mind if you. Please email me asap for more detail!",
					from: "Chicago, IL",
				}])

@mloseke_rides = Ride.create([
				{ request: true,
					title: "Pet Needs A Lift to L.A.!",
					description: "Hi There!\n\nLooking for a kind & responsible with experience traveling with a pet to give my sweet dog, Roguey Bear, a ride to L.A. She'll probably just sleep, stick her pretty head out the window (if you let her), and wear a goofy grin the whole time. I really miss her and I would love to reunited with her as soon as possible! If you need a co-pilot for your road trip then just let me know and I would be willing to help you with your cross country trek.\n\nPlease let me know at your earliest convenience. I would like her/us to be on the road in the next couple of weeks and we can work out the rest of the details in a follow-up email.\n\nThank you so much for reading and safe travels!",
					from: "Los Angeles, CA",
				},
				{ request: true,
					title: "Need Ride to Chicago-- Dwight IL to Chicago",
					description: "Hello,\nI absolutely need to get into city tonight and I'm broke and know it's a long shot but calling anyone making a trip up I-55 towards the city and would like a little company for the ride up!!\n\nI'm only about an hour south of the city, so if you're willing and super awesome shoot me an email or a text at (###) 555 0886",
					from: "Dwight, IL",
				},
				{ request: true,
					title: "Need a Ride to Florida after 6/16",
					description: "Hi I need a ride to FL to pick up a truck I purchased off the internet. I'm a clean 27 YO Sane Male who doesn't smoke or drink very respectful. Will be gladly willing to split the cost of gas the whole way down. Truck is Located in Verde Beach, FL Near Jacksonville. if anyone is heading down there soon and wants to cut there costs down please feel free to contact me.",
					from: "Crown Point, IN",
				}])

@bstolte.rides = @bstolte_rides
@keithnorm.rides = @keithnorm_rides
@mloseke.rides = @mloseke_rides

# send some messages
@bstolte.send_message(@keithnorm, "ceephax carfax", "sub ject ified")
@bstolte.send_message(@mloseke, "xafrac xahpeec", "diggie oree doo")

@keithnorm.send_message(@bstolte, "the name is Die innere orange", "a song from mouse on mars")
@keithnorm.send_message(@mloseke, "two turn tables and a microphone", "get fre")

@mloseke.send_message(@bstolte, "put the needle on the record", "where it's at")
@mloseke.send_message(@keithnorm, "dance dance revolution top model aft", "pump up the volume")
