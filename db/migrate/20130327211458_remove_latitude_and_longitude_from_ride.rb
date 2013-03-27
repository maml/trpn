class RemoveLatitudeAndLongitudeFromRide < ActiveRecord::Migration
	def change
		remove_column :rides, :latitude
	 	remove_column :rides, :longitude	
	end
end
