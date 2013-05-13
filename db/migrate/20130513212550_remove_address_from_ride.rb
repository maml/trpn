class RemoveAddressFromRide < ActiveRecord::Migration
  def up
		remove_column :rides, :address
  end

  def down
		add_column :rides, :address, :string
  end
end
