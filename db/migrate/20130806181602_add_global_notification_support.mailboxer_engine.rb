# This migration comes from mailboxer_engine (originally 20130305144212)
class AddGlobalNotificationSupport < ActiveRecord::Migration
  # definition for notifications table before this migration:
  # t.column :type, :string
  # t.column :body, :text
  # t.column :subject, :string, :default => ""
  # t.references :sender, :polymorphic => true
  # t.references :object, :polymorphic => true
  # t.column :conversation_id, :integer
  # t.column :draft, :boolean, :default => false
  # t.column :updated_at, :datetime, :null => false
  # t.column :created_at, :datetime, :null => false
  
  def up
    change_table :notifications do |t|
      t.boolean :global, default: false
      t.datetime :expires
    end
  end
  
  def down 
    change_table :notifications do |t|
      t.remove :global
      t.remove :expires
    end
  end
end
