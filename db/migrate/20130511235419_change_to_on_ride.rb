class ChangeToOnRide < ActiveRecord::Migration
  def up
		change_column :rides, :to, :string
  end

  def down
		change_column :rides, :to, :text
  end
end
