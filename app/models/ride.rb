class Ride < ActiveRecord::Base
  attr_accessible :description, :latitude, :longitude, :request, :title

	validates :title, :presence => true
end
