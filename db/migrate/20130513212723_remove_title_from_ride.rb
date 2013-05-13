class RemoveTitleFromRide < ActiveRecord::Migration
  def up
		remove_column :rides, :title
  end

  def down
		add_column :rides, :title, :string
  end
end
