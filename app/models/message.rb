class Message < ActiveRecord::Base
  attr_accessible :message, :user_id
	validates :message, :presence => true
	belongs_to :ride
	belongs_to :user
end
