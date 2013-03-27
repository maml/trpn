class Ride < ActiveRecord::Base
	self.rgeo_factory_generator = RGeo::Geos.factory_generator(:srid => 4326)

  attr_accessible :description, :latitude, :longitude, :request, :title, :center

	validates :title, :presence => true

	delegate :latitude, :to => :center, :allow_nil => true
  delegate :longitude, :to => :center, :allow_nil => true

	validates :latitude,
		:presence => true,
		:numericality => {
			:greater_than_or_equal_to => -90,
			:less_than_or_equal_to => 90
		}
	
  validates :longitude,
		:presence => true,
		:numericality => {
			:greater_than_or_equal_to => -180,
			:less_than_or_equal_to => 180
		}
end
