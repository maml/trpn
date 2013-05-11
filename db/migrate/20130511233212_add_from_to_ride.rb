class AddFromToRide < ActiveRecord::Migration
  def change
    add_column :rides, :from, :text
  end
end
