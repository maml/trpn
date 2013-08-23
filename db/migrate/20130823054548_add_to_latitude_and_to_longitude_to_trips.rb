class AddToLatitudeAndToLongitudeToTrips < ActiveRecord::Migration
  def change
    add_column :rides, :to_latitude, :float
    add_column :rides, :to_longitude, :float
  end
end
