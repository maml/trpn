class AddRideIdToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :ride_id, :integer
  end
end
