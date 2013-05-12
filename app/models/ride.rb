class Ride < ActiveRecord::Base
  attr_accessible :description, :latitude, :longitude, :request, :title, :address, :to, :from, :date

	validates :title, :presence => true

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode, :if => :latitude_changed? || :longitude_changed?

	def nearby(radius = 35)
		self.nearbys(radius)
	end
end
