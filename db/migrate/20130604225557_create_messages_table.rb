class CreateMessagesTable < ActiveRecord::Migration
  def up
		create_table :messages do |t|
  		t.text :message
			t.integer :ride_id
			t.timestamps
		end
  end

  def down
		drop_table :messages
  end
end