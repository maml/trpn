class Ride < ActiveRecord::Base
  attr_accessible :description, :latitude, :longitude, :request, :address, :to, :from, :date

	validates :description, :presence => true
	validates :from, :presence => true
	validates :to, :presence => true

	geocoded_by :from
	after_validation :geocode

	def nearby(radius = 35)
		self.nearbys(radius)
	end
	
	def title
		"#{read_attribute(:from)} to #{read_attribute(:to)}"
	end
end
