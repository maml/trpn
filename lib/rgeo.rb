class RGeo::Geos::CAPIPointImpl

	# only using latitude and longitude, could probably remove lat, lon, and lng

  alias_method :lat, :y
  alias_method :latitude, :y

  alias_method :lon, :x
  alias_method :lng, :x
  alias_method :longitude, :x

end
