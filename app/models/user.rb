class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
	validates :email, 								:presence => true
	validates :password, 							:presence => true, :confirmation => true
	validates :password_confirmation, :presence => true
end
