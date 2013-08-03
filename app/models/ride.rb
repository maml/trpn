class Ride < ActiveRecord::Base
  attr_accessible :description, :request, :to, :from, :date, :title

	belongs_to :user

	validates :title, :presence => true
	validates :description, :presence => true
	validates :from, :presence => true
	validates :user_id, :presence => true

	geocoded_by :from
	after_validation :geocode

	def nearby(radius = 35)
		self.nearbys(radius)
	end
end
