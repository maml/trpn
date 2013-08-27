class Ride < ActiveRecord::Base
  attr_accessible :description, :request, :to, :from, :date, :title

	belongs_to :user

	validates :title, :presence => true
	validates :description, :presence => true
	validates :from, :presence => true
	validates :user_id, :presence => true

	geocoded_by :from
	after_validation :geocode
	after_validation :geocode_to_location, if: "to_present?"

	def nearby(radius = 35)
		self.nearbys(radius)
	end

private

  def geocode_to_location
    results = Geocoder.search(self.to)
    result = results.first
    if result.latitude && result.longitude
      self.to_latitude = result.latitude
      self.to_longitude = result.longitude
    end
  end

	def to_present?
		!(self.to.nil? || self.to.empty?)
	end

end
