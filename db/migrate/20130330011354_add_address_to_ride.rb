class AddAddressToRide < ActiveRecord::Migration
  def change
    add_column :rides, :address, :string
  end
end
