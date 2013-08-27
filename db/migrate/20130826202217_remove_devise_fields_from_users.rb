class RemoveDeviseFieldsFromUsers < ActiveRecord::Migration
  def up
		remove_column :users, :current_sign_in_at
		remove_column :users, :last_sign_in_at
    remove_column :users, :current_sign_in_ip
    remove_column :users, :last_sign_in_ip
    remove_column :users, :sign_in_count
    remove_column :users, :remember_created_at
    remove_column :users, :reset_password_sent_at
    remove_column :users, :reset_password_token
  end

  def down
		raise ActiveRecord::IrreversibleMigration
  end
end
