class AddTitleToRide < ActiveRecord::Migration
  def change
    add_column :rides, :title, :string
  end
end
