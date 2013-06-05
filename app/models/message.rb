class Message < ActiveRecord::Base
  attr_accessible :message
	validates :message, :presence => true
	belongs_to :ride
end
