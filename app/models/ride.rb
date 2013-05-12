class Ride < ActiveRecord::Base
  attr_accessible :description, :latitude, :longitude, :request, :title, :address, :to, :from, :date

	geocoded_by :from
	after_validation :geocode

	def nearby(radius = 35)
		self.nearbys(radius)
	end
end
