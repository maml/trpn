class Ride < ActiveRecord::Base
  attr_accessible :description, :latitude, :longitude, :request, :title, :address, :to, :from, :date

	validates :description, :presence => true
	validates :from, :presence => true

	geocoded_by :from
	after_validation :geocode

	def nearby(radius = 35)
		self.nearbys(radius)
	end
end
