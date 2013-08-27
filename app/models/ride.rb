class Ride < ActiveRecord::Base
  attr_accessible :description, :request, :to, :from, :date, :title

	belongs_to :user

	validates :title, :presence => true
	validates :description, :presence => true
	validates :from, :presence => true
	validates :user_id, :presence => true

	geocoded_by :from
	after_validation :geocode, :geocode_to_location

	def nearby(radius = 35)
		self.nearbys(radius)
	end
  
  def geocode_to_location
		return if (self.to.nil? || self.to.empty?)
		debugger
    results = Geocoder.search(self.to)
    result = results.first
    if result.latitude && result.longitude
      self.to_latitude = result.latitude
      self.to_longitude = result.longitude
    end
  end
end
