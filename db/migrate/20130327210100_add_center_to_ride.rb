class AddCenterToRide < ActiveRecord::Migration
  def change
    add_column :rides, :center, :point, :srid => 4326, :null => false
  end
end
