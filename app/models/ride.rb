class Ride < ActiveRecord::Base
	self.rgeo_factory_generator = RGeo::Geos.factory_generator(:srid => 4326)

  attr_accessible :description, :latitude, :longitude, :request, :title, :center

	validates :title, :presence => true
end
