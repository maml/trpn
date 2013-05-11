class AddToToRide < ActiveRecord::Migration
  def change
    add_column :rides, :to, :text
  end
end
