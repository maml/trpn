class ChangeFromOnRide < ActiveRecord::Migration
  def up
		change_column :rides, :from, :string
  end

  def down
		change_column :rides, :from, :text
  end
end
